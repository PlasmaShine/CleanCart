//
//  ListCartItemsPresenterIO.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/19/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

@protocol CartPresenterRequest <NSObject>

- (void)fetchData;

@end

@protocol CartPresenterResponse <NSObject>

- (void)refreshUIWithData:(NSArray *)sectionList;

@end
