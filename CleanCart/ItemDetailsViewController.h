//
//  ItemDetailsViewController.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailsPresenterIO.h"

@interface ItemDetailsViewController : UIViewController <ItemDetailsPresenterResponse>;

@property (nonatomic, strong) id<ItemDetailsPresenterRequest> eventHandler;
@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) IBOutlet UILabel *itemDescription;
@property (weak, nonatomic) IBOutlet UILabel *itemPrice;
@property (weak, nonatomic) IBOutlet UILabel *itemStock;

@end
