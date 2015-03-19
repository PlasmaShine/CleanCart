//
//  Cart.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Cart.h"
#import "CartItem.h"

@interface Cart()

@property (nonatomic, strong) NSMutableArray *cartItems;
@end

@implementation Cart

- (instancetype) init {
    if (self=[super init] ) {
        self.cartItems = [NSMutableArray array];
    }
    return self;
}

- (void)addItemToCart:(Item *)item inQuantity:(NSInteger)quantity{
    BOOL itemFound = NO;
    for (NSInteger i = 0; i<self.cartItems.count; i++) {
        CartItem *currentCartItem = self.cartItems[i];
        Item *currentItem = currentCartItem.item;
        if([currentItem.itemId isEqualToString:item.itemId]) {
            itemFound = YES;
            currentCartItem.quantity++;
        }
    }
    if (!itemFound) {
        CartItem *newCartItem = [[CartItem alloc] init];
        newCartItem.item = item;
        newCartItem.quantity = quantity;
        [self.cartItems addObject:newCartItem];
    }
}

- (NSArray *)itemsInCart {
    return self.cartItems;
}

- (void)removeItemFromCart:(Item *)item {
    CartItem *cartItemToRemove = nil;
    for (NSInteger i=0; i<self.cartItems.count; i++) {
        CartItem *currentCartItem = self.cartItems[i];
        if ([currentCartItem.item.itemId isEqualToString:item.itemId]) {
            cartItemToRemove = currentCartItem;
            break;
        }
    }
    if (cartItemToRemove) {
        [self.cartItems removeObject:cartItemToRemove];
    }
}

@end
