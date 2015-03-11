//
//  NumberOfItemsInCartTransactionSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "NumberOfItemsInCartTransactionSpy.h"

@implementation NumberOfItemsInCartTransactionSpy

- (void)execute {
    self.didCallExecute = YES;
}

@end
