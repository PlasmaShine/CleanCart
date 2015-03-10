//
//  ItemRepository.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/23/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ItemRepository.h"

@interface ItemRepository()
    
@property (nonatomic, strong) NSArray* items;
@property (nonatomic, strong) Item* currentlySelectedItem;

@end

@implementation ItemRepository

- (void)fetchItems {
    [self.dataSource fetchItems];
}

#pragma mark - ItemRepositoryRequestMethods

- (NSArray *)allItems {
    if (self.items.count == 0) {
        [self.dataSource fetchItems];
    }
    return self.items;
}

- (Item *)itemForId:(NSString *)itemId {
    for (NSInteger i=0; i<self.items.count; i++) {
        Item *currentItem = self.items[i];
        if([currentItem.itemId isEqualToString:itemId]) {
            return currentItem;
        }
    }
    return nil;
}

- (void)selectItemForId:(NSString *)itemId {
    for(NSInteger i=0; i<self.items.count; i++) {
        Item *currentItem = self.items[i];
        if ([currentItem.itemId isEqualToString:itemId]) {
            self.currentlySelectedItem = currentItem;
            break;
        }
    }
}

- (Item *)selectedItem {
    return self.currentlySelectedItem;
}

#pragma mark - DataSourceResponse protocol methods

- (void)didReceiveItems:(NSArray *)items {
    if (items.count == 0) return;
    self.items = items;
    [self.delegate didReceiveItems:items];
}

@end
