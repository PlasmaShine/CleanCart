//
//  ItemDetailsTransactionSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/10/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ItemDetailsTransaction.h"

@interface ItemDetailsTransactionSpy : ItemDetailsTransaction

@property (nonatomic, assign) BOOL didCallExecute;

@end
