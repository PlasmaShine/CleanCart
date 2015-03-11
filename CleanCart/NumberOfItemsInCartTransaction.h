//
//  NumberOfItemsInCartTransaction.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Transaction.h"
#import "NumberOfItemsInCartTransactionIO.h"
#import "Cart.h"

@interface NumberOfItemsInCartTransaction : Transaction

@property (nonatomic, strong) Cart *cart;
@property (nonatomic, weak) id<NumberOfItemsInCartTransactionResponse> delegate;

@end
