//
//  CartPresenterSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/16/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "CartPresenter.h"

@interface CartPresenterSpy : CartPresenter

@property (nonatomic, assign) BOOL didReceiveCartItems;
@property (nonatomic, strong) NSArray *receivedItems;

@end
