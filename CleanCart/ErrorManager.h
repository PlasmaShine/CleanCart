//
//  ErrorManager.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/24/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ErrorManagerIO.h"

@interface ErrorManager : NSObject <ErrorManagerRequest>

@property (nonatomic, weak) id<ErrorManagerResponse> delegate;

@end
