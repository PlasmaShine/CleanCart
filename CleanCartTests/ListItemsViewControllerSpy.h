//
//  ListItemsViewControllerSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/1/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListItemsPresenterIO.h"

@interface ListItemsViewControllerSpy : NSObject <ListItemsPresenterResponse>

@property (nonatomic, assign) BOOL didReceiveRefreshUIMessage;

@end
