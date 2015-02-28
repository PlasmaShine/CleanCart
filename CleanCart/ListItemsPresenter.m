//
//  ListItemsPresenter.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/27/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ListItemsPresenter.h"

@implementation ListItemsPresenter

- (void)fetchItems {
    [self.listItemsTransaction execute];
}

@end
