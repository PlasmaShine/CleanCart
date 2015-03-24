//
//  ErrorManagerSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/24/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ErrorManager.h"

@interface ErrorManagerSpy : ErrorManager

@property (nonatomic, assign) BOOL didReceiveError;
@property (nonatomic, copy) NSString *receivedErrorDomain;
@property (nonatomic, assign) NSInteger receivedErrorCode;

@end
