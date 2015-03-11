//
//  ListItemsViewControllerSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/1/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ListItemsViewControllerSpy.h"

@implementation ListItemsViewControllerSpy


- (void)refreshUIWithData:(NSArray *)dataModel {
    self.receivedItems = dataModel;
    self.didReceiveRefreshUIMessage = YES;
}

- (void)numberOfItemsCurrentlyInCart:(NSString *)number {
    self.didReceiveNumberOfItemsInCartMessage = YES;
}

@end
