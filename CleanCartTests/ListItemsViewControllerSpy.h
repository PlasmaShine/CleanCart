//
//  ListItemsViewControllerSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/1/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListItemsPresenterIO.h"
#import "ListItemsViewController.h"

@interface ListItemsViewControllerSpy : ListItemsViewController <ListItemsPresenterResponse>

@property (nonatomic, strong) NSArray *receivedItems;
@property (nonatomic, assign) BOOL didReceiveRefreshUIMessage;

@end
