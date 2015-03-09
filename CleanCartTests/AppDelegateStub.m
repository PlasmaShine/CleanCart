//
//  AppDelegateStub.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "AppDelegateStub.h"

@implementation AppDelegateStub

- (instancetype)initWithFactory:(NavigatorFactory *)factory {
    if (self=[super init]) {
        self.navigatorFactory = factory;
    }
    return self;
}

@end
