//
//  DataSource.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

- (void)setDelegate:(id<DataSourceResponse>)delegate {
    //You should check if your delegates conform to all the required protocols
    //and throw an exception if not. This is in case you do something
    //stupid, you find out about it fast and not have to debug for hours/days
    if (delegate && ![delegate conformsToProtocol: @protocol(DataSourceResponse)]) {
        [[NSException exceptionWithName: NSInvalidArgumentException reason: @"Delegate object does not conform to the proper protocol" userInfo: nil] raise];
    }
    _delegate = delegate;
}

- (void)fetchItems {
    
}

@end