//
//  CartSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "CartSpy.h"

@implementation CartSpy

- (NSArray *)itemsInCart {
    self.didReceiveItemsInCartMessage = YES;
    return [super itemsInCart];
}

- (void)addItemToCart:(Item *)item inQuantity:(NSInteger)quantity{
    [super addItemToCart:item inQuantity:quantity];
    self.didReceiveAddToCartMessage = YES;
    self.itemAddedToCart = item;
}

@end
