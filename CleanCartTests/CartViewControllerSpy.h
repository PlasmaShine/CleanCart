//
//  CartViewControllerSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/19/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartViewController.h"

@interface CartViewControllerSpy : CartViewController

@property (nonatomic, assign) BOOL didReceiveRefreshUIMessage;
@property (nonatomic, assign) NSArray *receivedItems;

@end
