//
//  DataSourceSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSourceIO.h"

@interface DataSourceSpy : NSObject <DataSourceRequest>

@property (nonatomic, assign) BOOL didReceiveFetchItemsMessage;

@end
