//
//  ListItemsPresenterIO.h
//  CleanCart
//
//  Created by Nemes Norbert on 2/27/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

@protocol ListItemsPresenterRequest <NSObject>

- (void)fetchItems;

@end

@protocol ListItemsPresenterResponse <NSObject>

- (void)refreshUIWithData:(NSArray *) dataModel;

@end