//
//  ItemDetailsViewControllerSpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ItemDetailsViewControllerSpy.h"

@implementation ItemDetailsViewControllerSpy

- (void)presentItemDetails:(PresentableItemDetails *)itemDetails {
    self.didReceiveItemForPresentation = YES;
    self.receivedItem = itemDetails;
}

@end
