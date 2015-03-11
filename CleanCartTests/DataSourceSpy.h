//
//  DataSourceSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSource.h"

@interface DataSourceSpy : DataSource

@property (nonatomic, assign) BOOL didReceiveFetchItemsMessage;

@end
