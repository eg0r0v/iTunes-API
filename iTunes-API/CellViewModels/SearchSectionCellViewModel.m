//
//  SearchSectionCellViewModel.m
//  iTunes-API
//
//  Created by Илья Егоров on 20/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import "SearchSectionCellViewModel.h"
#import "SearchSectionTableViewCell.h"
#import "SearchResultsService.h"
#import "MediaObject.h"
#import "MediaObjectCollectionViewCell.h"
#import "MediaObjectCellViewModel.h"

@interface SearchSectionCellViewModel ()

@property (nonatomic, strong) NSArray<MediaObjectCellViewModel *> *cellViewModels;
@property (nonatomic, assign) SectionType type;

@end

@implementation SearchSectionCellViewModel

- (instancetype)initWithSection:(SectionType)sectionType
{
    self = [super init];
    if (self) {
        self.type = sectionType;
        [self setup];
    }
    return self;
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([SearchSectionTableViewCell class]);
}

- (void)setup {
    [self refreshData];
}

- (void)refreshData {
    RLMResults *items = [SearchResultsService.shared itemsForSection:self.type];
    NSMutableArray *newModels = [[NSMutableArray alloc] init];
    for (MediaObject *object in items) {
        MediaObjectCellViewModel *model = [[MediaObjectCellViewModel alloc] initWithMediaObjectName:object.name avatarUrlString:object.avatarUrlString];
        [newModels addObject:model];
    }
    self.cellViewModels = [newModels copy];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.cellViewModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = [MediaObjectCollectionViewCell cellIdentifier];
    MediaObjectCellViewModel *model = [self.cellViewModels objectAtIndex:indexPath.row];
    MediaObjectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    [cell setDelegate:model];
    
    return cell;
}

@end
