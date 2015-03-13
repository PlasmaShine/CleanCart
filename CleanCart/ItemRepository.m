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

- (void)fetchAllItemsWithCompletion:(void (^)(NSArray *))completionBlock {
    [self.dataSource fetchItemsWithCompletion:^(NSArray *items) {
        self.items = items;
        if (completionBlock) {
            completionBlock(items);
        }
    }];
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

@end
