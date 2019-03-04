//
//  SearchResultsViewController.m
//  iTunes-API
//
//  Created by Илья Егоров on 20/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import "SearchResultsViewController.h"
#import "SearchResultsTableViewModel.h"
#import "SearchSectionCellViewModel.h"
#import "SettingsTableViewController.h"
#import "Constants.h"

@interface SearchResultsViewController ()

@property (nonatomic, strong) SearchResultsTableViewModel *viewModel;

@end

@implementation SearchResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:searchString];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(openSettings)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [self setViewModel:[[SearchResultsTableViewModel alloc] init]];
    
    [self.tableView setDelegate:self.viewModel];
    [self.tableView setDataSource:self.viewModel];
    
    [self.viewModel removeAllMediaObjects];
    
    UIRefreshControl *control = [[UIRefreshControl alloc] init];
    [control addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    if (@available(iOS 10.0, *)) {
        self.tableView.refreshControl = control;
    } else {
        [self.tableView addSubview:control];
    }
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setTableFooterView:nil];
    
    NSString *cellIdentifier = [SearchSectionCellViewModel cellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellReuseIdentifier:cellIdentifier];
    
    [self refreshData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
}

- (void)refreshData {
    __weak SearchResultsViewController *weakSelf = self;
    [self.viewModel refreshDataWithCompletion:^(BOOL result) {
        [weakSelf.viewModel setup];
        [weakSelf.tableView reloadData];
        [weakSelf.refreshControl endRefreshing];
        
        if (result) {
            return;
        }
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка" message:@"Не удалось загрузить данные" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"ОК" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:true completion:nil];
        }];
        [alert addAction:cancelAction];
        [weakSelf presentViewController:alert animated:true completion:nil];
    }];
}

- (void)openSettings {
    SettingsTableViewController *settingsController = [[SettingsTableViewController alloc] init];
    [self.navigationController pushViewController:settingsController animated:true];
}

@end
