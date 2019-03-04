//
//  MediaObject.m
//  iTunes-API
//
//  Created by Илья Егоров on 20/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import "MediaObject.h"

@implementation MediaObject

+ (NSString *)primaryKey {
    return @"trackId";
}

- (instancetype)initWithTrackId:(NSString *)trackId
                           name:(NSString *)name
                   avatarString:(NSString *)avatarString {
    self = [super init];
    if (self) {
        self.trackId = trackId;
        self.name = name;
        self.avatarUrlString = avatarString;
    }
    return self;
}

@end
