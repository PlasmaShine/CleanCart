//
//  SelectItemTransaction.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/10/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "SelectItemTransaction.h"

@implementation SelectItemTransaction

- (void)execute {
    [self.itemRepository selectItemForId:self.itemId];
}

@end
