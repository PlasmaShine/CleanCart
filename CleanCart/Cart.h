//
//  Cart.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "Entity.h"

@interface Cart : Entity

- (void)addItemToCart:(Item *)item inQuantity:(NSInteger)quantity;
- (NSArray *)itemsInCart;
- (void)removeItemFromCart:(Item *)itemId;

@end
