//
//  ItemDetailsPresenter.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemDetailsTransactionIO.h"
#import "ItemDetailsPresenterIO.h"
#import "Presenter.h"

@interface ItemDetailsPresenter : Presenter <ItemDetailsTransactionResponse, ItemDetailsPresenterRequest>

@property (nonatomic, weak) id<ItemDetailsPresenterResponse> delegate;

@end
