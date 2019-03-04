//
//  SearchSectionTableViewCell.h
//  iTunes-API
//
//  Created by Илья Егоров on 20/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchSectionTableViewCell : UITableViewCell

- (void)setDelegate:(id <UICollectionViewDelegate, UICollectionViewDataSource>) delegate;

@end

NS_ASSUME_NONNULL_END
