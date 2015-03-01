//
//  ListItemsTransaction.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/25/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ListItemsTransaction.h"
#import "DisplayItem.h"
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
        DisplayItem *dispItem = [[DisplayItem alloc] init];
        dispItem.itemId = currentItem.itemId;
        dispItem.itemName = currentItem.itemName;
        dispItem.itemDescription = currentItem.itemDescription;
        dispItem.itemPrice = currentItem.itemPrice;
        dispItem.itemStock = currentItem.itemStock;
        [displayArray addObject:dispItem];
    }
    [self.delegate didReceiveItems:displayArray];
}

@end
