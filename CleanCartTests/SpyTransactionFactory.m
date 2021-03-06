//
//  SpyTransactionFactory.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "SpyTransactionFactory.h"
#import "ListItemsTransactionSpy.h"
#import "TransactionSpy.h"
#import "SelectItemTransactionSpy.h"

@implementation SpyTransactionFactory

- (Transaction *)createTransaction:(TransactionIdentifier)transactionId forCaller:(NSObject *)caller andParameter:(NSObject *)parameter {
    switch (transactionId) {
        case ListItemsTransactionId: {
            self.currentTransaction = [[ListItemsTransactionSpy alloc] init];
            break;
        }
        case SelectItemTransactionId: {
            SelectItemTransactionSpy *transaction = [[SelectItemTransactionSpy alloc] init];
            transaction.itemId = (NSString *)parameter;
            self.currentTransaction = transaction;
            break;
        }
        default:{
            TransactionSpy *transaction = [[TransactionSpy alloc] init];
            self.currentTransaction = transaction;
            break;
        }
    }
    return self.currentTransaction;
}
@end
