//
//  SettingsAvatarCellViewModel.m
//  iTunes-API
//
//  Created by Илья Егоров on 22/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import "SettingsAvatarCellViewModel.h"
#import "SettingsAvatarTableViewCell.h"
#import "Constants.h"

@implementation SettingsAvatarCellViewModel

+ (NSString *)cellIdentifier {
    return NSStringFromClass([SettingsAvatarTableViewCell class]);
}

- (BOOL)shouldShowAvatars {
    return [[NSUserDefaults standardUserDefaults] boolForKey:shouldShowAvatarsKey];
}

- (void)setShouldShowAvatars:(BOOL)shouldShowAvatars {
    [[NSUserDefaults standardUserDefaults] setBool:shouldShowAvatars forKey:shouldShowAvatarsKey];
}

@end
