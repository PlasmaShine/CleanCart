//
//  ListItemsTransaction.h
//  CleanCart
//
//  Created by Nemes Norbert on 2/25/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Transaction.h"
#import "ListItemsTransactionIO.h"
#import "ItemRepositoryIO.h"
#import "ItemRepository.h"

@interface ListItemsTransaction : Transaction <ItemRepositoryResponse>

@property (nonatomic, weak) id<ListItemsTransactionResponse> delegate;
@property (nonatomic, strong) ItemRepository *itemRepository;

@end
