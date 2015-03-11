//
//  AddToCartTransactionSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "AddToCartTransaction.h"

@interface AddToCartTransactionSpy : AddToCartTransaction

@property (nonatomic, assign) BOOL didCallExecute;

@end
