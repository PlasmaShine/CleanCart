//
//  ListItemsPresenter.h
//  CleanCart
//
//  Created by Nemes Norbert on 2/27/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListItemsTransactionIO.h"
#import "ListItemsPresenterIO.h"
#import "Transaction.h"
#import "Navigator.h"
#import "TransactionFactory.h"

@interface ListItemsPresenter : NSObject <ListItemsTransactionResponse, ListItemsPresenterRequest>

@property (nonatomic, strong) Navigator *navigator;
@property (nonatomic, strong) TransactionFactory *transactionFactory;
@property (nonatomic, weak) id<ListItemsPresenterResponse> delegate;

@end
