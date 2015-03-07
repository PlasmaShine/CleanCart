//
//  ListItemsCollectionCell.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/5/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DisplayListItem.h"
#import "ListItemsCollectionCellDelegate.h"

@interface ListItemsCollectionCell : UICollectionViewCell

@property (nonatomic, strong) DisplayListItem *item;
@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;
@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) IBOutlet UILabel *itemPrice;
@property (weak, nonatomic) IBOutlet UILabel *itemStock;

@property (weak, nonatomic) id<ListItemsCollectionCellDelegate> delegate;

@end
