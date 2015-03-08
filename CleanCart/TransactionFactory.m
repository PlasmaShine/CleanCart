//
//  TransactionFactory.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "TransactionFactory.h"
#import "ListItemsTransactionIO.h"
#import "ItemRepository.h"
#import "JSONDataSource.h"
#import "ListItemsTransaction.h"

@implementation TransactionFactory

- (Transaction *)createTransaction:(TransactionIdentifier)transactionId forCaller:(NSObject *)caller andParameter:(NSObject *)parameter {
    switch (transactionId) {
        case ListItemsTransactionId:
            return [self _createListItemsTransactionForCaller:caller andParameter:parameter];
        default:
            return nil;
    }
    return nil;
}

- (Transaction *)_createListItemsTransactionForCaller:(NSObject *)caller andParameter:(NSObject *)parameter {
    if (![caller conformsToProtocol:@protocol(ListItemsTransactionResponse)]) {
        NSException *exception = [NSException exceptionWithName:@"Invalid caller" reason:@"Caller does not conform to the ListItemsTransactionResponse protocol" userInfo:nil];
        [exception raise];
    }
    ListItemsTransaction *transaction = [[ListItemsTransaction alloc] init];
    ItemRepository *itemRepo = [[ItemRepository alloc] init];
    JSONDataSource *dataSource = [[JSONDataSource alloc] init];
    itemRepo.dataSource = dataSource;
    dataSource.delegate = itemRepo;
    transaction.repository = itemRepo;
    itemRepo.delegate = transaction;
    transaction.delegate = (id<ListItemsTransactionResponse>)caller;
    return transaction;
}

@end
