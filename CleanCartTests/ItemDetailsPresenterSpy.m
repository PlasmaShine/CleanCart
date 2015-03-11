//
//  ItemDetailsPresenterSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ItemDetailsPresenterSpy.h"

@implementation ItemDetailsPresenterSpy

- (void)presentItem:(Item *)item {
    self.didReceiveItem = YES;
    self.receivedItem = item;
}

- (void)fetchItemToPresent {
    self.didCallFetchItemToPresent = YES;
}

- (void)viewWillAppear {
    self.didReceiveViewWillAppearMessage = YES;
}

- (void)viewWillDisappear {
    self.didReceiveViewWillDisappearMessage = YES;
}

@end
