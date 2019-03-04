//
//  SettingsTableViewModel.m
//  iTunes-API
//
//  Created by Илья Егоров on 22/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import "SettingsTableViewModel.h"
#import "SettingsAvatarCellViewModel.h"
#import "SettingsAvatarTableViewCell.h"

@interface SettingsTableViewModel ()

@property (nonatomic, strong) NSArray<SettingsAvatarCellViewModel *> *cellViewModels;

@end

@implementation SettingsTableViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.cellViewModels = @[
                            [[SettingsAvatarCellViewModel alloc] init]
                            ];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cellViewModels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingsAvatarCellViewModel *model = [self.cellViewModels objectAtIndex:indexPath.row];
    NSString *cellIdentifier = [SettingsAvatarCellViewModel cellIdentifier];
    SettingsAvatarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [cell setDelegate:model];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.f;
}

@end
