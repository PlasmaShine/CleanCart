//
//  ItemDetailsViewController.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ItemDetailsViewController.h"

@implementation ItemDetailsViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self.eventHandler fetchItemToPresent];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.eventHandler viewWillAppear];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.eventHandler viewWillDisappear];
    [super viewWillDisappear:animated];
}

#pragma mark - ItemDetailsPresenterResponse -

- (void)presentItemDetails:(PresentableItemDetails *)itemDetails {
    self.itemName.text = itemDetails.itemName;
    self.itemDescription.text = itemDetails.itemDescription;
    self.itemPrice.text = itemDetails.itemPrice;
    self.itemStock.text = itemDetails.itemStock;
}

@end
