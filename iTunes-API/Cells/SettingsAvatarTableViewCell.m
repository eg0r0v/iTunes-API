//
//  SettingsAvatarTableViewCell.m
//  iTunes-API
//
//  Created by Илья Егоров on 22/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import "SettingsAvatarTableViewCell.h"

@interface SettingsAvatarTableViewCell ()

@property (weak, nonatomic) IBOutlet UISwitch *shouldShowAvatarsSwitch;

@end

@implementation SettingsAvatarTableViewCell

- (void)setDelegate:(id<SettingsAvatarTableViewCellDelegate>)delegate {
    _delegate = delegate;
    [self.shouldShowAvatarsSwitch setOn:delegate.shouldShowAvatars];
}

- (IBAction)switchValueChanged:(UISwitch *)sender {
    [self.delegate setShouldShowAvatars:sender.isOn];
}

@end
