//
//  ItemRepository.h
//  CleanCart
//
//  Created by Nemes Norbert on 2/23/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSource.h"
#import "ItemRepositoryIO.h"
#import "Item.h"

@interface ItemRepository : NSObject <DataSourceResponse>

@property (nonatomic, strong) DataSource *dataSource;
@property (nonatomic, strong) id<ItemRepositoryResponse> delegate;

- (void)fetchItems;
- (NSArray *)allItems;
- (Item *)itemForId:(NSString *)itemId;
- (void)selectItemForId:(NSString *)itemId;
- (Item *)selectedItem;

@end
