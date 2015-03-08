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

#pragma mark - DataSourceResponse protocol methods

- (void)didReceiveItems:(NSArray *)items {
    if (items.count == 0) return;
    self.items = items;
    [self.delegate didReceiveItems:items];
}

@end
