//
//  ItemDetailsTransactionSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/10/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ItemDetailsTransactionSpy.h"

@implementation ItemDetailsTransactionSpy

- (void)execute {
    self.didCallExecute = YES;
}

@end
