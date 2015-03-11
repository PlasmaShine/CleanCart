//
//  AddToCartTransaction.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "AddToCartTransaction.h"

@implementation AddToCartTransaction

- (void)execute {
    Item *item = [self.itemRepository itemForId:self.itemId];
    if (item) {
        [self.cart addItemToCart:item];
    }
}

@end
