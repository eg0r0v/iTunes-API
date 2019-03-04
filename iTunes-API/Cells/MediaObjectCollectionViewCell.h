//
//  MediaObjectCollectionViewCell.h
//  iTunes-API
//
//  Created by Илья Егоров on 20/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaObjectCollectionViewCellDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@class MediaObjectCellViewModel;

@interface MediaObjectCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) id <MediaObjectCollectionViewCellDelegate> delegate;

+ (NSString *)cellIdentifier;

- (void)updateAvatarVisibility;

@end

NS_ASSUME_NONNULL_END
