//
//  MediaObject.h
//  iTunes-API
//
//  Created by Илья Егоров on 20/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface MediaObject : RLMObject

@property (nonatomic, copy) NSString *trackId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *avatarUrlString;

- (instancetype)initWithTrackId:(NSString *)trackId name:(NSString *)name avatarString:(NSString *)avatarString NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithValue:(id)value NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
