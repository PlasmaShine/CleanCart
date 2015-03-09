//
//  ItemDetailsPresenter.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ItemDetailsPresenter.h"

@implementation ItemDetailsPresenter

#pragma mark - ItemDetailsPresenterRequest -



#pragma mark - ItemDetailsTransactionResponse -

- (void)presentItem:(Item *)item {
    PresentableItemDetails *itemDetails = [[PresentableItemDetails alloc] init];
    itemDetails.itemId = [item.itemId copy];
    itemDetails.itemName = [item.itemName copy];
    itemDetails.itemDescription = [item.itemDescription copy];
    itemDetails.itemPrice = [NSString stringWithFormat:@"%ld", item.itemPrice];
    itemDetails.itemStock = [NSString stringWithFormat:@"%ld", item.itemStock];
    [self.delegate presentItemDetails:itemDetails];
}

@end
