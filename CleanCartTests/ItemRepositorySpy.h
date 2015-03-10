//
//  ItemRepositorySpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 2/23/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemRepository.h"

@interface ItemRepositorySpy : ItemRepository

@property (nonatomic, assign) BOOL didReceiveAllItemsMessage;
@property (nonatomic, assign) BOOL didReceiveItemRetrievalMessage;
@property (nonatomic, assign) BOOL didReceiveItemForIdMessage;
@property (nonatomic, assign) BOOL didReceiveSelectItemMessage;
@property (nonatomic, assign) BOOL didReceiveSelectedItemMessage;
@property (nonatomic, copy) NSString *receivedItemId;
@end
