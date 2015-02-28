//
//  ListItemsTransactionSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 2/26/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Transaction.h"
#import "ItemRepositoryIO.h"

@interface ListItemsTransactionSpy : Transaction <ItemRepositoryResponse>

@property (nonatomic, assign) BOOL didReceiveItemsReceivedMessage;
@property (nonatomic, assign) BOOL didReceiveExecuteMessage;
@property (nonatomic, strong) NSArray *receivedItems;

@end
