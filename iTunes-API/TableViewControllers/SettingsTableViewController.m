//
//  SettingsTableViewController.m
//  iTunes-API
//
//  Created by Илья Егоров on 22/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "SettingsTableViewModel.h"
#import "SettingsAvatarCellViewModel.h"

@interface SettingsTableViewController ()

@property (nonatomic, strong) SettingsTableViewModel *viewModel;

@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"Settings"];
   
    [self setViewModel:[[SettingsTableViewModel alloc] init]];
    
    [self.tableView setDelegate:self.viewModel];
    [self.tableView setDataSource:self.viewModel];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setTableFooterView:nil];
    
    NSString *cellIdentifier = [SettingsAvatarCellViewModel cellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellReuseIdentifier:cellIdentifier];
}

@end
