//
//  NumberOfItemsInCartTransactionSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "NumberOfItemsInCartTransaction.h"

@interface NumberOfItemsInCartTransactionSpy : NumberOfItemsInCartTransaction

@property (nonatomic, assign) BOOL didCallExecute;

@end
