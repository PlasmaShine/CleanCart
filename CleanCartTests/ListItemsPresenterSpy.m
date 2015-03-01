//
//  ListItemsPresenterSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/28/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ListItemsPresenterSpy.h"

@implementation ListItemsPresenterSpy

- (void)didReceiveItems:(NSArray *)items {
    self.receivedItems = items;
    self.didReceiveItemsFromTransaction = YES;
}
@end
