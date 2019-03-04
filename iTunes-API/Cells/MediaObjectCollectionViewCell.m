//
//  MediaObjectCollectionViewCell.m
//  iTunes-API
//
//  Created by Илья Егоров on 20/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "MediaObjectCollectionViewCell.h"
#import "MediaObjectCellViewModel.h"

@interface MediaObjectCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *avatarImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

@end

@implementation MediaObjectCollectionViewCell

+ (NSString *)cellIdentifier {
    return NSStringFromClass(self);
}

- (void)setDelegate:(id<MediaObjectCollectionViewCellDelegate>)delegate {
    _delegate = delegate;
    [self updateAvatarVisibility];
    [self.nameLabel setText:[delegate mediaObjectName]];
}

- (void)updateAvatarVisibility {
    if ([self.delegate shouldShowAvatars]) {
        [self.avatarImageView setHidden: NO];
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:[self.delegate avatarUrlString]]];
    } else {
        [self.avatarImageView setHidden: YES];
    }
}

@end
