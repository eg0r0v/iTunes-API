//
//  BaseCellViewModel.m
//  iTunes-API
//
//  Created by Илья Егоров on 20/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCellViewModel.h"

@implementation BaseCellViewModel

+ (NSString *)cellIdentifier {
    return NSStringFromClass([UITableViewCell class]);
}

@end
