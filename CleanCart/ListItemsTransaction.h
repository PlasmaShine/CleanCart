//
//  ListItemsTransaction.h
//  CleanCart
//
//  Created by Nemes Norbert on 2/25/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Transaction.h"
#import "ListItemsTransactionIO.h"
#import "ItemRepository.h"

@interface ListItemsTransaction : Transaction

@property (nonatomic, weak) id<ListItemsTransactionResponse> delegate;

- (instancetype)initWithRepository:(ItemRepository *)repository;

@end
