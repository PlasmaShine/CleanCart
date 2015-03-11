//
//  ListItemsPresenterIO.h
//  CleanCart
//
//  Created by Nemes Norbert on 2/27/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

@protocol ListItemsPresenterRequest <NSObject>

- (void)fetchData;
- (void)cartButtonTapped;
- (void)didSelectItemWithId:(NSString *)itemId;
- (void)addToCartItemWithId:(NSString *)itemId;
- (void)viewWillAppear;
- (void)viewWillDisappear;

@end

@protocol ListItemsPresenterResponse <NSObject>

- (void)refreshUIWithData:(NSArray *) dataModel;
- (void)numberOfItemsCurrentlyInCart:(NSString *) number;

@end
