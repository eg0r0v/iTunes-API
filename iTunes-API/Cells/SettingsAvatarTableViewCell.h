//
//  SettingsAvatarTableViewCell.h
//  iTunes-API
//
//  Created by Илья Егоров on 22/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsAvatarTableViewCellDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingsAvatarTableViewCell : UITableViewCell

@property (nonatomic, weak) id <SettingsAvatarTableViewCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
