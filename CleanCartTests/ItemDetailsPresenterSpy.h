//
//  ItemDetailsPresenterSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ItemDetailsPresenter.h"
#import "Item.h"

@interface ItemDetailsPresenterSpy : ItemDetailsPresenter

@property (nonatomic, assign) BOOL didCallFetchItemToPresent;
@property (nonatomic, assign) BOOL didReceiveItem;
@property (nonatomic, strong) Item *receivedItem;

@end
