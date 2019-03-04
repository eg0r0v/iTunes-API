//
//  SearchSectionCellViewModel.h
//  iTunes-API
//
//  Created by Илья Егоров on 20/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCellViewModel.h"
#import "SectionType.h"

@class MediaObjectCellViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface SearchSectionCellViewModel : BaseCellViewModel <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, assign, readonly) SectionType type;

- (instancetype)initWithSection:(SectionType)sectionType NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
