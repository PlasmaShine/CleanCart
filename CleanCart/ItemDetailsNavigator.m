//
//  ItemDetailsNavigator.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/10/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ItemDetailsNavigator.h"

@implementation ItemDetailsNavigator

- (void)presentViewFromViewController:(UIViewController *)fromViewController {
    if ([fromViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navController = (UINavigationController *)fromViewController;
        [navController pushViewController:self.rootViewController animated:YES];
    } else {
        [fromViewController presentViewController:self.rootViewController animated:YES completion:nil];
    }
}

@end
