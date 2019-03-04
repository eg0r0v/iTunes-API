//
//  SearchResultsTableViewModel.h
//  iTunes-API
//
//  Created by Илья Егоров on 20/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchSectionCellViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultsTableViewModel : NSObject <UITableViewDelegate, UITableViewDataSource>

- (void)setup;
- (void)removeAllMediaObjects;
- (void)refreshDataWithCompletion:(void (^)(BOOL))completion;

@end

NS_ASSUME_NONNULL_END
