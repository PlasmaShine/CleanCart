//
//  DataSourceSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "DataSourceSpy.h"

@implementation DataSourceSpy

- (void)fetchItemsWithCompletion:(void (^)(NSArray *))completionBlock {
    self.didReceiveFetchItemsMessage = YES;
}

@end
