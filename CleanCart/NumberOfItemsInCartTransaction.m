//
//  NumberOfItemsInCartTransaction.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "NumberOfItemsInCartTransaction.h"
#import "CartItem.h"

@implementation NumberOfItemsInCartTransaction

- (void)execute {
    NSArray *cartItems = [self.cart itemsInCart];
    NSInteger numberOfItemsInCart = 0;
    for (NSInteger i=0; i<cartItems.count; i++) {
        CartItem *currentItem = cartItems[i];
        numberOfItemsInCart += currentItem.quantity;
    }
    [self.delegate numberOfItemsCurrentlyInCart:numberOfItemsInCart];
}
     
@end
