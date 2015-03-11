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
#import "ItemDetailsTransactionIO.h"
#import "ItemDetailsTransaction.h"
#import "SelectItemTransaction.h"

@interface TransactionFactory()

@property (nonatomic, strong) ItemRepository *itemRepository;

@end

@implementation TransactionFactory

- (instancetype)init {
    if (self = [super init]) {
        self.itemRepository = [[ItemRepository alloc] init];
        JSONDataSource *dataSource = [[JSONDataSource alloc] init];
        self.itemRepository.dataSource = dataSource;
        dataSource.delegate = self.itemRepository;
    }
    return self;
}

- (Transaction *)createTransaction:(TransactionIdentifier)transactionId forCaller:(NSObject *)caller andParameter:(NSObject *)parameter {
    switch (transactionId) {
        case ListItemsTransactionId:
            return [self _createListItemsTransactionForCaller:caller andParameter:parameter];
        case SelectItemTransactionId:
            return [self _createSelectItemTransactionForCaller:caller andParameter:parameter];
        case ItemDetailsTransactionId: {
            return [self _createItemDetailsTransactionForCaller:caller andParameter:parameter];
        }
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
    transaction.itemRepository = self.itemRepository;
    self.itemRepository.delegate = transaction;
    transaction.delegate = (id<ListItemsTransactionResponse>)caller;
    return transaction;
}

- (Transaction *)_createSelectItemTransactionForCaller:(NSObject *)caller andParameter:(NSObject *)parameter {
    SelectItemTransaction *transaction = [[SelectItemTransaction alloc] init];
    transaction.itemRepository = self.itemRepository;
    transaction.itemId = (NSString *)parameter;
    return transaction;
}

- (Transaction *)_createItemDetailsTransactionForCaller:(NSObject *)caller andParameter:(NSObject *)parameter {
    if (![caller conformsToProtocol:@protocol(ItemDetailsTransactionResponse)]) {
        NSException *exception = [NSException exceptionWithName:@"Invalid caller" reason:@"Caller does not conform to the ItemDetailsTransactionResponse protocol" userInfo:nil];
        [exception raise];
    }
    ItemDetailsTransaction *transaction = [[ItemDetailsTransaction alloc] init];
    transaction.itemRepository = self.itemRepository;
    transaction.delegate = (id<ItemDetailsTransactionResponse>)caller;
    return transaction;
}


@end
