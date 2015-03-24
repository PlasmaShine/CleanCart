//
//  Cart.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Cart.h"
#import "CartItem.h"
#import "ErrorCodes.h"
#import "ErrorDomains.h"

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
    CartItem *cartItem = [self _findCartItemById:item.itemId];
    BOOL isError = NO;
    if (cartItem ) {
        if (cartItem.quantity + quantity <=cartItem.item.itemStock) {
            cartItem.quantity+=quantity;
        } else {
            isError = YES;
        }
    } else {
        if (quantity <= item.itemStock) {
            cartItem = [[CartItem alloc] init];
            cartItem.item = item;
            cartItem.quantity = quantity;
            [self.cartItems addObject:cartItem];
        } else {
            isError = YES;
        }
    }
    if (isError) {
        [self.errorManager pushErrorWithDomain:CartErrorDomain andCode:QuantityExceedsStockErrorCode];
    }
}

- (CartItem *)_findCartItemById:(NSString *)itemId {
    for (NSInteger i = 0; i<self.cartItems.count; i++) {
        CartItem *currentCartItem = self.cartItems[i];
        Item *currentItem = currentCartItem.item;
        if([currentItem.itemId isEqualToString:itemId]) {
            return currentCartItem;
        }
    }
    return nil;
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
