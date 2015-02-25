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

#pragma mark - ItemRepositoryRequestMethods

- (NSArray *)allItems {
    return self.items;
}

#pragma mark - DataSourceResponse protocol methods

- (void)didReceiveItems:(NSArray *)items {
    self.items = items;
}

@end
