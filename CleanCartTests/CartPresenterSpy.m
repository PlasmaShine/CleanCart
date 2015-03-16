//
//  CartPresenterSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/16/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "CartPresenterSpy.h"

@implementation CartPresenterSpy

- (void)cartItemsReceived:(NSArray *)cartItems {
    self.receivedItems = cartItems;
    self.didReceiveCartItems = YES;
}

@end
