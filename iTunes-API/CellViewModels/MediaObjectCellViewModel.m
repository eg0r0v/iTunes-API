//
//  MediaObjectCellViewModel.m
//  iTunes-API
//
//  Created by Илья Егоров on 21/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import "MediaObjectCellViewModel.h"
#import "MediaObject.h"
#import "Constants.h"

@interface MediaObjectCellViewModel ()

@property (nonatomic, copy) NSString *avatarUrlString;
@property (nonatomic, copy) NSString *name;

@end

@implementation MediaObjectCellViewModel

- (instancetype)initWithMediaObjectName:(NSString *)name avatarUrlString:(NSString *)avatarString {
    self = [super init];
    if (self) {
        self.name = name;
        self.avatarUrlString = avatarString;
    }
    return self;
}

- (NSString *)mediaObjectName {
    return self.name;
}

- (BOOL)shouldShowAvatars {
    return [[NSUserDefaults standardUserDefaults] boolForKey:shouldShowAvatarsKey];
}

@end
