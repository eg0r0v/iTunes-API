//
//  SearchResultsService.m
//  iTunes-API
//
//  Created by Илья Егоров on 20/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import "SearchResultsService.h"
#import "Constants.h"
#import "SectionType.h"
#import "Movie.h"
#import "MusicTrack.h"

@interface SearchResultsService ()

@property (nonatomic, strong) NSURLSession *currentSession;

@end

@implementation SearchResultsService

+ (instancetype)shared {
    static SearchResultsService *service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[SearchResultsService alloc] init];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        service.currentSession = [NSURLSession sessionWithConfiguration:configuration];
    });
    return service;
}

- (void)refreshAllItemsWithCompletion:(void (^)(BOOL))completion {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
        dispatch_group_t group = dispatch_group_create();
        __block BOOL success = TRUE;
        void(^resultBlock)(BOOL) = ^(BOOL result) {
            success = success && result;
            dispatch_group_leave(group);
        };
        dispatch_group_enter(group);
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
            [self performSearchRequestForCategory:SectionTypeMusic completion:resultBlock];
        });
        dispatch_group_enter(group);
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
            [self performSearchRequestForCategory:SectionTypeMovie completion:resultBlock];
        });
        long result = dispatch_group_wait(group, dispatch_time(DISPATCH_TIME_NOW, (int64_t) (5 * NSEC_PER_SEC)));
        if (result != 0) {
            [self removeAllMediaObjects];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(result == 0 && success);
        });
    });
}

- (RLMResults *)itemsForSection:(SectionType)type {
    Class objectClass = [self classForSection:type];
    return [objectClass allObjects];
}

- (void)removeAllMediaObjects {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm deleteAllObjects];
    }];
}

- (Class)classForSection:(SectionType)type {
    switch (type) {
        case SectionTypeMusic: return [MusicTrack class];
        case SectionTypeMovie: return [Movie class];
    }
}

- (void)performSearchRequestForCategory:(SectionType)type completion:(void (^)(BOOL))completion
{
    NSString *searchTypeString = [searchString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *sectionString = type == SectionTypeMovie ? @"movie" : @"musicTrack";
    NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&entity=%@",
                           searchTypeString,
                           sectionString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *dataTask = [self.currentSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data)
        {
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData: data
                                                                    options: NSJSONReadingAllowFragments error: &error];
            if (error != nil) {
                completion(NO);
                return;
            }
            [self processResponse:results forType:type completion:completion];
        }
    }];
    [dataTask resume];
}

#pragma mark - Result Action

- (void)processResponse:(NSDictionary *)response forType:(SectionType)type completion:(void (^)(BOOL))completion
{
    Class mediaObjectClass = [SearchResultsService.shared classForSection:type];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        RLMResults *oldObjects = [self itemsForSection:type];
        [realm deleteObjects:oldObjects];
        
        NSMutableArray *resultsArray = [NSMutableArray array];
        for (NSDictionary *result in response[@"results"]) {
            NSString *trackId = [NSString stringWithFormat:@"%@", result[@"trackId"]];
            NSString *name = result[@"trackCensoredName"];
            NSString *avatarString = result[@"artworkUrl100"];
            
            MediaObject *object = [[mediaObjectClass alloc] initWithTrackId:trackId name:name avatarString:avatarString];
            [resultsArray addObject:object];
        }
        [realm addOrUpdateObjects:[resultsArray copy]];
    }];
    completion(YES);
}

@end
