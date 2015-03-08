//
//  ItemRepository.h
//  CleanCart
//
//  Created by Nemes Norbert on 2/23/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSourceIO.h"
#import "ItemRepositoryIO.h"

@interface ItemRepository : NSObject <DataSourceResponse>

@property (nonatomic, strong) id<DataSourceRequest> dataSource;
@property (nonatomic, strong) id<ItemRepositoryResponse> delegate;

- (void)fetchItems;
- (NSArray *)allItems;

@end
