//
//  NavigatorFactory.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavigationMessage.h"

@class Navigator;

@interface NavigatorFactory : NSObject

- (Navigator *)navigatorForMessage:(NavigationMessage) message;

@end
