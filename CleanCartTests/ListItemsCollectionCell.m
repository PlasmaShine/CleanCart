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

@end;

@implementation ListItemsCollectionCell

- (void)setItem:(DisplayListItem *)item {
    _item = item;
    self.itemName.text = item.itemName;
    self.itemPrice.text = item.itemPrice;
    self.itemStock.text = item.itemStock;
}

- (IBAction)addTocartTapped:(id)sender {
    [self.delegate addToCartTappedForItemWithId:self.item.itemId];
}
@end
