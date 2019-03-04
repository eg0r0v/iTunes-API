//
//  MediaObjectCollectionViewCellDelegate.h
//  iTunes-API
//
//  Created by Илья Егоров on 22/02/2019.
//  Copyright © 2019 Ilya Egorov. All rights reserved.
//

#ifndef MediaObjectCollectionViewCellDelegate_h
#define MediaObjectCollectionViewCellDelegate_h
#endif /* MediaObjectCollectionViewCellDelegate_h */

@protocol MediaObjectCollectionViewCellDelegate <NSObject>

- (NSString *)avatarUrlString;
- (NSString *)mediaObjectName;
- (BOOL)shouldShowAvatars;

@end
