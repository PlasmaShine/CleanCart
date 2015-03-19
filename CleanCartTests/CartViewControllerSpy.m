//
//  CartViewControllerSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/19/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "CartViewControllerSpy.h"

@implementation CartViewControllerSpy

- (void)refreshUIWithData:(NSArray *)sectionList {
    self.didReceiveRefreshUIMessage = YES;
    self.receivedItems = sectionList;
}

@end
