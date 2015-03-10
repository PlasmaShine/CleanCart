//
//  SpyNavigatorFactory.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/10/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "NavigatorFactory.h"

@interface SpyNavigatorFactory : NavigatorFactory

@property (nonatomic, strong) Navigator * createdNavigator;

@end
