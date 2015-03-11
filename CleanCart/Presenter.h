//
//  Presenter.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/10/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Navigator.h"
#import "TransactionFactory.h"

@interface Presenter : NSObject

@property (nonatomic, strong) Navigator *navigator;
@property (nonatomic, strong) TransactionFactory *transactionFactory;

- (void)viewWillAppear;
- (void)viewWillDisappear;

@end
