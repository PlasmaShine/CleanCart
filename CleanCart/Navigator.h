//
//  Navigator.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NavigationMessage.h"
#import "NavigatorFactory.h"

@interface Navigator : NSObject

@property (nonatomic, strong) UIViewController *rootViewController;
@property (nonatomic, strong) NavigatorFactory *navigatorFactory;

- (void)performNavigationForMessage:(NavigationMessage) message;

@end
