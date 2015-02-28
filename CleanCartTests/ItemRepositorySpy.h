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
@end
