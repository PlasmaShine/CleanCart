//
//  NavigatorFactorySpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "NavigatorFactorySpy.h"

@implementation NavigatorFactorySpy

- (Navigator *)navigatorForMessage:(NavigationMessage)message {
    self.didReceiveNavigationMessage = YES;
    self.receivedMessage = message;
    return nil;
}

@end
