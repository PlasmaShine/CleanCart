//
//  ItemRepository.h
//  CleanCart
//
//  Created by Nemes Norbert on 2/23/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSource.h"
#import "Item.h"

@interface ItemRepository : NSObject

@property (nonatomic, strong) DataSource *dataSource;

- (void)fetchAllItemsWithCompletion:(void(^)(NSArray *items)) completionBlock;
- (Item *)itemForId:(NSString *)itemId;
- (void)selectItemForId:(NSString *)itemId;
- (Item *)selectedItem;

@end
