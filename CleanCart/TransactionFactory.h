//
//  TransactionFactory.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TransactionIds.h"

@class Transaction;

@interface TransactionFactory : NSObject

- (Transaction *)createTransaction:(TransactionIdentifier) transactionId forCaller:(NSObject *)caller andParameter:(NSObject *)parameter;

@end
