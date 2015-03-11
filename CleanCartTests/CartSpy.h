//
//  CartSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Cart.h"

@interface CartSpy : Cart

@property (nonatomic, assign) BOOL didReceiveItemsInCartMessage;
@property (nonatomic, assign) BOOL didReceiveAddToCartMessage;
@property (nonatomic, strong) Item *itemAddedToCart;

@end
