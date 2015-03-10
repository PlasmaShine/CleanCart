//
//  SelectItemTransaction.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/10/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Transaction.h"
#import "ItemRepository.h"

@interface SelectItemTransaction : Transaction

@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, strong) ItemRepository *itemRepository;

@end
