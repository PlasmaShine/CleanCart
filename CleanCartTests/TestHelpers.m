//
//  TestHelpers.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/13/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "TestHelpers.h"

@implementation TestHelpers

#pragma mark  - time out method -

+ (void)waitFor:(BOOL *)flag timeout:(NSTimeInterval)timeoutSecs {
    NSDate *timeoutDate = [NSDate dateWithTimeIntervalSinceNow:timeoutSecs];
    while (!*flag && [timeoutDate timeIntervalSinceNow] >= 0.0) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:timeoutDate];
    };
}

@end
