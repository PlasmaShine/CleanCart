//
//  ListItemsCellDelegateSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/6/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListItemsCollectionCellDelegate.h"

@interface ListItemsCellDelegateSpy : NSObject <ListItemsCollectionCellDelegate>

@property (nonatomic, assign) BOOL didReceiveAddToCartMessage;
@property (nonatomic, copy) NSString *receivedItemId;

@end
