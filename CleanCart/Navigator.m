//
//  Navigator.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Navigator.h"

@implementation Navigator

- (void)performNavigationForMessage:(NavigationMessage)message {
    Navigator *navigator = [self.navigatorFactory navigatorForMessage:message];
    [navigator presentViewFromViewController:self.rootViewController];
}

- (void)presentViewFromViewController:(UIViewController *)fromViewController {
    if ([fromViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navController = (UINavigationController *)fromViewController;
        [navController pushViewController:self.rootViewController animated:YES];
    } else {
        [fromViewController presentViewController:self.rootViewController animated:YES completion:nil];
    }
}

@end
