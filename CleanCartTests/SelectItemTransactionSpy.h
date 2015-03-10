//
//  SelectItemTransactionSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/10/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "SelectItemTransaction.h"

@interface SelectItemTransactionSpy : SelectItemTransaction

@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, assign) BOOL didCallExecute;
@end
