//
//  ListItemsPresenterSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 2/28/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ListItemsPresenter.h"

@interface ListItemsPresenterSpy : ListItemsPresenter

@property (nonatomic, assign) BOOL didReceiveItemsFromTransaction;
@property (nonatomic, strong) NSArray *receivedItems;

@end
