//
//  ItemDetailsTransactionIO.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Item.h"

@protocol ItemDetailsTransactionResponse <NSObject>

- (void)presentItem:(Item *)item;

@end