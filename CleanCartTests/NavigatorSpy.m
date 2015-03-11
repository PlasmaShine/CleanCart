//
//  NavigatorSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "NavigatorSpy.h"

@implementation NavigatorSpy

- (void)performNavigationForMessage:(NavigationMessage)message {
    self.receivedMessage = message;
}

- (void)presentViewFromViewController:(UIViewController *)fromViewController {
    self.didReceivePresentViewControllerMessage = YES;
}

@end
