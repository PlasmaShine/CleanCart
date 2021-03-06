//
//  ItemDetailsPresenter.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ItemDetailsPresenter.h"
#import "Transaction.h"

@implementation ItemDetailsPresenter

#pragma mark - ItemDetailsPresenterRequest -



#pragma mark - ItemDetailsTransactionResponse -

- (void)presentItem:(Item *)item {
    PresentableItemDetails *itemDetails = [[PresentableItemDetails alloc] initWithItem:item];
    [self.delegate presentItemDetails:itemDetails];
}

#pragma mark - ItemDetailsPresenterRequest -

- (void)fetchItemToPresent {
    Transaction *transaction = [self.transactionFactory createTransaction:ItemDetailsTransactionId forCaller:self andParameter:nil];
    [transaction execute];
}

@end
