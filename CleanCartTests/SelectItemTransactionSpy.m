//
//  SelectItemTransactionSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/10/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "SelectItemTransactionSpy.h"

@implementation SelectItemTransactionSpy

- (void)execute {
    self.didCallExecute = YES;
}

@end
