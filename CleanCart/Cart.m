//
//  Cart.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Cart.h"

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

- (void)addItemToCart:(Item *)item {
    [self.cartItems addObject:item];
}

- (NSArray *)itemsInCart {
    return self.cartItems;
}

- (void)removeItemFromCart:(Item *)item {
    [self.cartItems removeObject:item];
}

@end
