//
//  ListItemsTransaction.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/25/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ListItemsTransaction.h"
#import "DisplayListItem.h"
#import "Item.h"

@implementation ListItemsTransaction


- (void)execute {
    [self.repository allItems];
}

#pragma mark - ItemRepositoryResponse

- (void)didReceiveItems:(NSArray *)items {
    [self.delegate didReceiveItems:items];
}

@end
