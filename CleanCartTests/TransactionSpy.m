//
//  TransactionSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/16/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "TransactionSpy.h"

@implementation TransactionSpy

- (void)execute {
    self.didCallExecute = YES;
}

@end
