//
//  ListItemsCellDelegateSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/6/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ListItemsCellDelegateSpy.h"

@implementation ListItemsCellDelegateSpy

- (void)didTapAddToCartForItemWithId:(NSString *)itemId {
    self.didReceiveAddToCartMessage = YES;
    self.receivedItemId = itemId;
}

@end
