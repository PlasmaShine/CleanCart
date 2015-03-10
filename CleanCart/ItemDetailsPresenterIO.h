//
//  ItemDetailsPresenterIO.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "PresentableItemDetails.h"

@protocol ItemDetailsPresenterRequest <NSObject>

- (void)fetchItemToPresent;

@end

@protocol ItemDetailsPresenterResponse <NSObject>

- (void)presentItemDetails:(PresentableItemDetails *) itemDetails;

@end