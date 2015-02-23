//
//  DataSourceIO.h
//  CleanCart
//
//  Created by Nemes Norbert on 2/23/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

@protocol DataSourceResponse <NSObject>

- (void)didReceiveItems:(NSArray *)items;

@end

@protocol DataSourceRequest <NSObject>

@property (nonatomic, weak) id<DataSourceResponse> delegate;

- (void)fetchItems;

@end

