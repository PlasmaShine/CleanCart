//
//  ListItemsCollectionCellDelegate.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/6/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

@protocol ListItemsCollectionCellDelegate <NSObject>

- (void)didTapAddToCartForItemWithId:(NSString *)itemId;

@end