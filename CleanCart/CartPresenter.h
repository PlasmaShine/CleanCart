//
//  CartPresenter.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/16/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListCartItemsTransactionIO.h"
#import "CartPresenterIO.h"
#import "Presenter.h"

@interface CartPresenter : Presenter <ListCartItemsTransactionResponse, CartPresenterRequest>

@property (nonatomic, weak) id<CartPresenterResponse> delegate;
@end
