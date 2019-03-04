//
//  SearchResultsTableViewModel.m
//  iTunes-API
//
//  Created by Илья Егоров on 20/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import "SearchResultsTableViewModel.h"
#import "SearchSectionTableViewCell.h"
#import "SearchSectionCellViewModel.h"
#import "SearchResultsService.h"

@interface SearchResultsTableViewModel ()

@property (nonatomic, strong) NSArray<SearchSectionCellViewModel *> *cellViewModels;

@end

@implementation SearchResultsTableViewModel

- (void)setup {
    self.cellViewModels = @[
                            [[SearchSectionCellViewModel alloc] initWithSection: SectionTypeMovie],
                            [[SearchSectionCellViewModel alloc] initWithSection:SectionTypeMusic]
                            ];
}

- (void)removeAllMediaObjects {
    [SearchResultsService.shared removeAllMediaObjects];
}

- (void)refreshDataWithCompletion:(void (^)(BOOL))completion {
    [SearchResultsService.shared refreshAllItemsWithCompletion:completion];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.cellViewModels count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SearchSectionCellViewModel *model = [self.cellViewModels objectAtIndex:indexPath.section];
    
    NSString *cellIdentifier = [SearchSectionCellViewModel cellIdentifier];
    
    SearchSectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [cell setDelegate:model];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180.f;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    SearchSectionCellViewModel *model = [self.cellViewModels objectAtIndex:section];
    switch (model.type) {
        case SectionTypeMovie: return @"Movies";
        case SectionTypeMusic: return @"Music";
    }
}

@end
