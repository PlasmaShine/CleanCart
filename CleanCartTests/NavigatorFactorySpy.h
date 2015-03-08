//
//  NavigatorFactorySpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "NavigatorFactory.h"
#import "NavigationMessage.h"

@interface NavigatorFactorySpy : NavigatorFactory

@property (nonatomic, assign) BOOL didReceiveNavigationMessage;
@property (nonatomic, assign) NavigationMessage receivedMessage;
@end
