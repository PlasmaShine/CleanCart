//
//  PresentableItemDetails.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "PresentableItemDetails.h"

@implementation PresentableItemDetails

- (instancetype)initWithItem:(Item *)item {
    if (self = [super init]) {
        self.itemId = [item.itemId copy];
        self.itemName = [item.itemName copy];
        self.itemDescription = [item.itemDescription copy];
        self.itemPrice = [NSString stringWithFormat:@"%ld", item.itemPrice];
        self.itemStock = [NSString stringWithFormat:@"%ld", item.itemStock];
    }
    return self;
}

@end
