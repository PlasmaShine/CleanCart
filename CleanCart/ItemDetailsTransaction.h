//
//  ItemDetailsTransaction.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Transaction.h"
#import "ItemRepository.h"
#import "ItemDetailsTransactionIO.h"

@interface ItemDetailsTransaction : Transaction

@property (nonatomic, weak) id<ItemDetailsTransactionResponse> delegate;
@property (nonatomic, strong) ItemRepository *itemRepository;

@end
