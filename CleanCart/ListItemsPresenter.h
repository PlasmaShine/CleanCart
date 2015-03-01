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

@interface ListItemsPresenter : NSObject <ListItemsTransactionResponse, ListItemsPresenterRequest>

@property (nonatomic, strong) Transaction* listItemsTransaction;
@property (nonatomic, weak) id<ListItemsPresenterResponse> delegate;

@end
