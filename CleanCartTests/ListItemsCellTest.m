//
//  ListItemsTableCellTest.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/5/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ListItemsCollectionCell.h"
#import "ListItemsViewController.h"
#import "DisplayListItem.h"
#import "Section.h"
#import "ListItemsCellDelegateSpy.h"

@interface ListItemsCellTest : XCTestCase

@property (nonatomic, strong) ListItemsCollectionCell *sut;
@property (nonatomic, strong) DisplayListItem *item;
@property (nonatomic, strong) ListItemsCellDelegateSpy *cellDelegateSpy;

@end

@implementation ListItemsCellTest

- (void)setUp {
    [super setUp];
    ListItemsViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ListItemsViewController"];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    NSArray *testSectionArray = [self _createTestData];
    [vc refreshUIWithData:testSectionArray];
    self.sut = (ListItemsCollectionCell *)[vc collectionView:vc.collectionView cellForItemAtIndexPath:indexPath];
    self.cellDelegateSpy = [[ListItemsCellDelegateSpy alloc] init];
    self.sut.delegate = self.cellDelegateSpy;
}

- (void)tearDown {
    self.item = nil;
    self.sut = nil;
    [super tearDown];
}

#pragma mark - Helpers -

- (NSArray *)_createTestData {
    Section *section = [[Section alloc] init];
    self.item = [[DisplayListItem alloc] init];
    self.item.itemId = @"1";
    self.item.itemName = @"Item 2";
    self.item.itemPrice = [NSString stringWithFormat:@"%d", 4000];
    self.item.itemStock = [NSString stringWithFormat:@"%d",34];
    section.items = [NSArray arrayWithObjects:self.item, nil];
    return [NSArray arrayWithObjects:section, nil];
}

#pragma mark - Tests -

- (void)testCellIsPreoperlyConfiguredWhenSettingAnItem {
    XCTAssertEqualObjects(self.sut.itemName.text, self.item.itemName, @"Cell should have set item name");
    XCTAssertEqualObjects(self.sut.itemPrice.text, self.item.itemPrice, @"Cell should have set item price");
    XCTAssertEqualObjects(self.sut.itemStock.text, self.item.itemStock, @"Cell should have set item stock");
}

- (void)testTappingOnAddToCartMethodSendsMessageToDelegate {
    [self.sut.addToCartButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    XCTAssertTrue(self.cellDelegateSpy.didReceiveAddToCartMessage, @"Cell delegate should have received add to cart message");
    XCTAssertEqualObjects(self.cellDelegateSpy.receivedItemId, self.item.itemId, @"Received incorrect item ID");
}

@end
