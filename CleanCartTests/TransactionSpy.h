//
//  TransactionSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/16/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Transaction.h"

@interface TransactionSpy : Transaction

@property (nonatomic, assign) BOOL didCallExecute;

@end
