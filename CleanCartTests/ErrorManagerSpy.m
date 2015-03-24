//
//  ErrorManagerSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/24/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ErrorManagerSpy.h"

@implementation ErrorManagerSpy

-(void)pushErrorWithDomain:(NSString *)domain andCode:(NSInteger)code {
    self.didReceiveError = YES;
    self.receivedErrorCode = code;
    self.receivedErrorDomain = domain;
}

@end
