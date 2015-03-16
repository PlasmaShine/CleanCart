//
//  ListCartItemsTransaction.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/16/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Transaction.h"
#import "Cart.h"
#import "ListCartItemsTransactionIO.h"

@interface ListCartItemsTransaction : Transaction

@property (nonatomic, strong) Cart *cart;
@property (nonatomic, weak) id<ListCartItemsTransactionResponse> delegate;

@end
