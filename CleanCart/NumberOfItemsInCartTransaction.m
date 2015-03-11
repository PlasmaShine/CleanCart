//
//  NumberOfItemsInCartTransaction.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "NumberOfItemsInCartTransaction.h"

@implementation NumberOfItemsInCartTransaction

- (void)execute {
    NSArray *cartItems = [self.cart itemsInCart];
    [self.delegate numberOfItemsCurrentlyInCart:cartItems.count];
}
     
@end
