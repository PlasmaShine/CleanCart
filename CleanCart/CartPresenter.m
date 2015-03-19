//
//  CartPresenter.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/16/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "CartPresenter.h"
#import "Transaction.h"
#import "Section.h"
#import "PresentableCartItem.h"
#import "Item.h"
@implementation CartPresenter

#pragma mark - ListCartItemsPresenterRequest methods -

-(void)fetchData {
    Transaction *transaction = [self.transactionFactory createTransaction:ListCartItemsTransactionId forCaller:self andParameter:nil];
    [transaction execute];
}

#pragma mark - ListCartItemsTransactionResponse -

- (void)didReceiveCartItems:(NSArray *)cartItems {
    if (cartItems.count > 0) {
        Section *section = [[Section alloc] init];
        NSMutableArray *itemList = [NSMutableArray array];
        for (NSInteger i=0; i<cartItems.count; i++) {
            PresentableCartItem *cartItem = [[PresentableCartItem alloc] init];
            Item *currentItem = cartItems[i];
            cartItem.itemId = currentItem.itemId;
            cartItem.itemName = currentItem.itemName;
//            cartItem.itemQuantity = [NSString stringWithFormat:@"%ld",currentItem.quantity];
        }
        NSArray *sectionList = [NSArray arrayWithObjects:section, nil];
        [self.delegate refreshUIWithData:sectionList];
    }
}

@end
