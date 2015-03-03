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

@interface ListItemsTransaction()

@property(nonatomic, strong) ItemRepository *repository;

@end

@implementation ListItemsTransaction

- (instancetype)initWithRepository:(id)repository {
    if (self = [super init]) {
        self.repository = repository;
    }
    return self;
}

- (void)execute {
    [self.repository allItems];
}

#pragma mark - ItemRepositoryResponse

- (void)didReceiveItems:(NSArray *)items {
    NSMutableArray *displayArray = [NSMutableArray array];
    for (NSInteger i=0; i<items.count; i++) {
        Item *currentItem = items[i];
        DisplayListItem *dispItem = [[DisplayListItem alloc] init];
        dispItem.itemId = [currentItem.itemId copy];
        dispItem.itemName = [currentItem.itemName copy];
        dispItem.itemPrice = currentItem.itemPrice;
        [displayArray addObject:dispItem];
    }
    [self.delegate didReceiveItems:displayArray];
}

@end
