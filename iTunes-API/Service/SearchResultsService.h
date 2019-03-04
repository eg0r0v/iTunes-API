//
//  SearchResultsService.h
//  iTunes-API
//
//  Created by Илья Егоров on 20/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SectionType.h"

@class RLMResults;

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultsService : NSObject

+ (SearchResultsService *)shared;

- (RLMResults *)itemsForSection:(SectionType)type;

- (void)removeAllMediaObjects;
- (void)refreshAllItemsWithCompletion:(void (^)(BOOL))completion;

@end

NS_ASSUME_NONNULL_END
