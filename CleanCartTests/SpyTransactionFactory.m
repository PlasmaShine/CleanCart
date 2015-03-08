//
//  SpyTransactionFactory.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "SpyTransactionFactory.h"
#import "ListItemsTransactionSpy.h"

@implementation SpyTransactionFactory

- (Transaction *)createTransaction:(TransactionIdentifier)transactionId forCaller:(NSObject *)caller andParameter:(NSObject *)parameter {
    switch (transactionId) {
        case ListItemsTransactionId: {
            self.currentTransaction = [[ListItemsTransactionSpy alloc] init];
            return self.currentTransaction;
        }

        default:{
            self.currentTransaction = nil;
            return nil;
        }
    }

}
@end
