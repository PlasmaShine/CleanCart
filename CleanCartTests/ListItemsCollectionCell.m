//
//  ListItemsCollectionCell.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/5/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ListItemsCollectionCell.h"

@interface ListItemsCollectionCell()

- (IBAction)addTocartTapped:(id)sender;

@end

@implementation ListItemsCollectionCell

- (void)setItem:(PresentableListItem *)item {
    _item = item;
    self.itemName.text = item.itemName;
    self.itemPrice.text = item.itemPrice;
    self.itemStock.text = item.itemStock;
    self.addToCartButton.enabled = self.item.enabled;
}

- (IBAction)addTocartTapped:(id)sender {
    [self.delegate didTapAddToCartForItemWithId:self.item.itemId];
}
@end
