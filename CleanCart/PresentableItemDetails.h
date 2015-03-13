//
//  PresentableItemDetails.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface PresentableItemDetails : NSObject

@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *itemDescription;
@property (nonatomic, copy) NSString *itemPrice;
@property (nonatomic, copy) NSString *itemStock;

- (instancetype)initWithItem:(Item *)item;

@end
