//
//  ItemRepositoryTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/23/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Item.h"
#import "ItemRepository.h"
#import "ListItemsTransactionSpy.h"
#import "DataSourceSpy.h"

@interface ItemRepositoryTests : XCTestCase

@property (nonatomic, strong) ListItemsTransactionSpy *interactorSpy;
@property (nonatomic, strong) ItemRepository *sut;
@property (nonatomic, strong) NSArray *items;

@end

@implementation ItemRepositoryTests

- (void)setUp {
    [super setUp];
    self.sut = [[ItemRepository alloc] init];
    Item *item1 = [[Item alloc] init];
    item1.itemId = @"1";
    Item *item2 = [[Item alloc] init];
    item2.itemId = @"2";
    self.items = [[NSArray alloc] initWithObjects:item1, item2, nil];
    self.interactorSpy = [[ListItemsTransactionSpy alloc] init];
    self.sut.delegate = self.interactorSpy;
}

- (void)tearDown {
    self.sut = nil;
    self.items = nil;
    self.interactorSpy = nil;
    [super tearDown];
}

#pragma mark - Tests -

- (void)testCallingFetchItemsOnItemRepositoryTransmitsTheCallToDataSource {
    DataSourceSpy *dataSpy = [[DataSourceSpy alloc] init];
    self.sut.dataSource = dataSpy;
    [self.sut fetchItems];
    XCTAssertTrue(dataSpy.didReceiveFetchItemsMessage, @"Should have called fetch Items on the data source");
}

- (void)testItemRepositoryReturnsCorrectItems {
    [self.sut didReceiveItems:self.items];
    XCTAssertEqualObjects([self.sut allItems], self.items, @"Items in the repository should be identical to those received from the data source");
}

- (void)testItemRepositoryNotifiesDelegateWhenItemsAreReceived {
    [self.sut didReceiveItems:self.items];
    XCTAssertTrue(self.interactorSpy.didReceiveItemsReceivedMessage, @"Delegate  should have received message from repository");
    XCTAssertEqualObjects(self.items, self.interactorSpy.receivedItems, @"Interactor should have same list as received by repository");
}

- (void)testItemReposidoreDoesNotNotifyDelegateWhenThereAreNoItemsRetrieved {
    [self.sut didReceiveItems:[NSArray array]];
    XCTAssertFalse(self.interactorSpy.didReceiveItemsReceivedMessage, @"Delegate  should NOT have received message from repository");
}

- (void)testRepositoryReturnsCorrectItemForItemForId {
    [self.sut didReceiveItems:self.items];
    Item *firstItem = self.items[0];
    Item *retrievedItem = [self.sut itemForId:firstItem.itemId];
    XCTAssertEqualObjects(firstItem, retrievedItem, @"Items should be the same");
}

- (void)testRepositoryReturnsNilForNonExistingItemId {
    [self.sut didReceiveItems:self.items];
    Item *retrievedItem = [self.sut itemForId:@"bla"];
    XCTAssertNil(retrievedItem, @"Item should be nil");
}

@end
