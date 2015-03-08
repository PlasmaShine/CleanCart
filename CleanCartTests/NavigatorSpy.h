//
//  NavigatorSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Navigator.h"
#import "NavigationMessage.h"

@interface NavigatorSpy : Navigator

@property (nonatomic, assign) NavigationMessage receivedMessage;

@end
