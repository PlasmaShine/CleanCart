//
//  ListItemsTransactionTest.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/25/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ItemRepositorySpy.h"
#import "ListItemsTransaction.h"
#import "ListItemsTransactionIO.h"
#import "Item.h"
#import "ListItemsPresenterSpy.h"
#import "DisplayListItem.h"

@interface ListItemsTransactionTest : XCTestCase

@property (nonatomic, strong) ListItemsTransaction *sut;
@property (nonatomic, strong) ItemRepositorySpy *repoSpy;
@property (nonatomic, strong) ListItemsPresenterSpy *presenterSpy;
@property (nonatomic, strong) NSArray *items;
@end

@implementation ListItemsTransactionTest

- (void)setUp {
    [super setUp];
    self.repoSpy = [[ItemRepositorySpy alloc] init];
    self.sut = [[ListItemsTransaction alloc] initWithRepository:self.repoSpy];
    self.items = [self _createItemArray];
    self.presenterSpy = [[ListItemsPresenterSpy alloc] init];
    self.sut.delegate = self.presenterSpy;
    [self.sut didReceiveItems:self.items];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - Helper methods

- (NSArray *)_createItemArray {
    Item *item = [[Item alloc] init];
    item.itemId = @"Item 1 id";
    item.itemDescription = @"Item 1 description";
    item.itemName = @"Item 1 name";
    item.itemPrice = 500;
    item.itemStock = 3;
    return [[NSArray alloc] initWithObjects:item, nil];
}

- (void)_assertItem:(Item *)item isEqualToDisplayItem:(DisplayListItem *)displayItem {
    XCTAssertEqualObjects(displayItem.itemId, item.itemId, @"Should have the same item ID");
    XCTAssertEqualObjects(displayItem.itemName, item.itemName, @"Should have the same item name");
    XCTAssertEqual(displayItem.itemPrice, item.itemPrice, @"Should have the same item price");
}

#pragma mark - Tests

- (void)testCallingExecuteOnTransactionSendsMessageToRepository {
    [self.sut execute];
    XCTAssertTrue(self.repoSpy.didReceiveAllItemsMessage, @"Execute should call repository to get items");
}

- (void)testListItemTransactionReturnsReceivedItemsToPresenter {
    XCTAssertTrue(self.presenterSpy.didReceiveItemsFromTransaction, @"Should have received items from transaction");
}

- (void)testItemsAreSentToPresenterAsDisplayItems {
    XCTAssertEqual(self.presenterSpy.receivedItems.count, self.items.count, @"Number of items in the presenter should be the same as the number of items in the interactor");
    for (NSInteger i = 0; i<self.items.count; i++) {
        XCTAssertTrue([self.presenterSpy.receivedItems[i] isKindOfClass:[DisplayListItem class]], @"Items in the presenter should be of DisplayItem type");
        [self _assertItem:self.items[i] isEqualToDisplayItem:self.presenterSpy.receivedItems[i]];
    }
}


@end
