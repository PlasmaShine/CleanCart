//
//  DataSourceStub.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/13/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "DataSourceStub.h"

@implementation DataSourceStub

- (void)fetchItemsWithCompletion:(void (^)(NSArray *))completionBlock {
    completionBlock(self.itemsToReturn);
}

@end
