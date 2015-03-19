//
//  CartItem.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/19/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface CartItem : NSObject

@property (nonatomic, strong) Item *item;
@property (nonatomic, assign) NSInteger quantity;

@end
