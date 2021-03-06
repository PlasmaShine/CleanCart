//
//  NumberOfItemsInCartTransactionIO.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NumberOfItemsInCartTransactionResponse <NSObject>

- (void)numberOfItemsCurrentlyInCart:(NSInteger) number;

@end
