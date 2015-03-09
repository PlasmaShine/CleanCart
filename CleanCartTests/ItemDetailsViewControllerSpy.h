//
//  ItemDetailsViewControllerSpy.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ItemDetailsViewController.h"
#import "PresentableItemDetails.h"

@interface ItemDetailsViewControllerSpy : ItemDetailsViewController

@property (nonatomic, assign) BOOL didReceiveItemForPresentation;
@property (nonatomic, strong) PresentableItemDetails *receivedItem;

@end
