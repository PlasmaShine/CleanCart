//
//  AddToCartTransaction.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Transaction.h"
#import "Cart.h"
#import "ItemRepository.h"

@interface AddToCartTransaction : Transaction

@property (nonatomic, strong) Cart *cart;
@property (nonatomic, strong) ItemRepository *itemRepository;
@property (nonatomic, copy) NSString *itemId;

@end
