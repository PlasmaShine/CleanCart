//
//  PresentableListItem.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/1/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "PresentableListItem.h"

@implementation PresentableListItem

- (instancetype)initWithItem:(Item *)item {
    if (self = [super init]) {
        self.itemId = [item.itemId copy];
        self.itemName = [item.itemName copy];
        self.itemPrice = [NSString stringWithFormat:@"%ld", item.itemPrice];
        self.itemStock = [NSString stringWithFormat:@"%ld", item.itemStock];
        self.enabled = item.itemStock > 0 ? YES : NO;
    }
    return self;
}

@end
