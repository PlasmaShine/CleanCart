//
//  DataSource.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSourceIO.h"

@interface DataSource : NSObject

@property (nonatomic, weak) id<DataSourceResponse> delegate;

- (void)fetchItems;

@end
