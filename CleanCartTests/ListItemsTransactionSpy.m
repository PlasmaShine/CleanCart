//
//  ListItemInteractorSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/26/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ListItemsTransactionSpy.h"

@implementation ListItemsTransactionSpy

- (void)execute {
    self.didReceiveExecuteMessage = YES;
    [self.itemRepository fetchAllItemsWithCompletion:^(NSArray *items) {
        self.didReceiveItemsReceivedMessage = YES;
        self.receivedItems = items;
    }];
}

@end
