//
//  SpyTransactionFactory.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "TransactionFactory.h"

@interface SpyTransactionFactory : TransactionFactory

@property (nonatomic, strong) Transaction *currentTransaction;

@end
