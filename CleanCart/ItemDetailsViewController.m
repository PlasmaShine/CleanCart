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
    [self.eventHandler fetchItemToPresent];
}

#pragma mark - ItemDetailsPresenterResponse -

- (void)presentItemDetails:(PresentableItemDetails *)itemDetails {

}

@end
