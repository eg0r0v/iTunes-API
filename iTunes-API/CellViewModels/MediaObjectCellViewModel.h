//
//  MediaObjectCellViewModel.h
//  iTunes-API
//
//  Created by Илья Егоров on 21/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import "BaseCellViewModel.h"
#import "MediaObjectCollectionViewCellDelegate.h"

@class MediaObject;

NS_ASSUME_NONNULL_BEGIN

@interface MediaObjectCellViewModel : BaseCellViewModel <MediaObjectCollectionViewCellDelegate>

- (instancetype)initWithMediaObjectName:(NSString *)name
                        avatarUrlString:(NSString *)avatarString NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
