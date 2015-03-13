//
//  DataSource.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

- (void)fetchItemsWithCompletion:(void (^)(NSArray *))completionBlock {
    if(completionBlock) {
        completionBlock(nil);
    }
}

@end
