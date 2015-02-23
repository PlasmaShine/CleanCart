//
//  JSONDataSource.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/23/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "JSONDataSource.h"

@implementation JSONDataSource
@synthesize delegate = _delegate;

- (void)setDelegate:(id<DataSourceResponse>)delegate {
    if (![delegate conformsToProtocol: @protocol(DataSourceResponse)]) {
        [[NSException exceptionWithName: NSInvalidArgumentException reason: @"Delegate object does not conform to the proper protocol" userInfo: nil] raise];
    }
    _delegate = delegate;
}

#pragma mark - DataSourceRequest methods

- (void)fetchItems {
    [self.delegate didReceiveItems:[NSArray array]];
}

@end
