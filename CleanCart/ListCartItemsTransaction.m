//
//  ListCartItemsTransaction.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/16/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ListCartItemsTransaction.h"

@implementation ListCartItemsTransaction

- (void)execute {
    NSArray *cartItems = [self.cart itemsInCart];
    [self.delegate didReceiveCartItems:cartItems];
}

@end
