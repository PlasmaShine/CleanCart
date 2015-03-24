//
//  ErrorManagerIO.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/24/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

@protocol ErrorManagerRequest <NSObject>

- (void)pushErrorWithDomain:(NSString *)domain andCode:(NSInteger) code;

@end

@protocol ErrorManagerResponse <NSObject>

@end
