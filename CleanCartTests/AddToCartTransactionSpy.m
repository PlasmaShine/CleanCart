//
//  AddToCartTransactionSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "AddToCartTransactionSpy.h"

@implementation AddToCartTransactionSpy

- (void)execute {
    self.didCallExecute = YES;
}

@end
