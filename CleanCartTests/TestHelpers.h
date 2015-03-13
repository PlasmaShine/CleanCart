//
//  TestHelpers.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/13/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestHelpers : NSObject

+ (void)waitFor:(BOOL *)flag timeout:(NSTimeInterval)timeoutSecs;

@end
