//
//  ListItemsTransactionSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 2/26/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ListItemsTransaction.h"

@interface ListItemsTransactionSpy : ListItemsTransaction

@property (nonatomic, assign) BOOL didReceiveItemsReceivedMessage;
@property (nonatomic, assign) BOOL didReceiveExecuteMessage;
@property (nonatomic, strong) NSArray *receivedItems;

@end
