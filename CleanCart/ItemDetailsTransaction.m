//
//  ItemDetailsTransaction.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ItemDetailsTransaction.h"

@implementation ItemDetailsTransaction

- (void)execute {
    Item *item = [self.itemRepository itemForId:self.itemId];
    if (item) {
        [self.delegate presentItem:item];
    }
}

@end
