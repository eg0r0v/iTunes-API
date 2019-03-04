//
//  SearchSectionTableViewCell.m
//  iTunes-API
//
//  Created by Илья Егоров on 20/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import "SearchSectionTableViewCell.h"
#import "MediaObject.h"

@interface SearchSectionTableViewCell ()

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation SearchSectionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSString *cellIdentifier = @"MediaObjectCollectionViewCell";
    [self.collectionView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellWithReuseIdentifier:cellIdentifier];
}

- (void)setDelegate:(id<UICollectionViewDelegate, UICollectionViewDataSource>)delegate {
    self.collectionView.delegate = delegate;
    self.collectionView.dataSource = delegate;
    [self.collectionView reloadData];
}

@end
