//
//  SpyNavigatorFactory.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/10/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "SpyNavigatorFactory.h"
#import "NavigatorSpy.h"

@implementation SpyNavigatorFactory

- (Navigator *)navigatorForMessage:(NavigationMessage)message {
    self.createdNavigator = [[NavigatorSpy alloc] init];
    return self.createdNavigator;
}
@end
