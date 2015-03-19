//
//  ListCartItemsTransactionIO.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/16/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

@protocol ListCartItemsTransactionResponse <NSObject>

- (void)didReceiveCartItems:(NSArray *)cartItems;

@end
