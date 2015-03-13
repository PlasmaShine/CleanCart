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
#import "DataSourceStub.h"
#import "TestHelpers.h"

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
    DataSourceStub *dataSourceStub = [[DataSourceStub alloc] init];
    dataSourceStub.itemsToReturn = self.items;
    self.sut.dataSource = dataSourceStub;
    [self.sut fetchAllItemsWithCompletion:nil];
}

- (void)tearDown {
    self.sut = nil;
    self.items = nil;
    self.interactorSpy = nil;
    [super tearDown];
}

#pragma mark - Tests -

- (void)testCallingAllItemsWhenThereAreNoItemsInRepositoryFetchesItemsFromDataSource {
    DataSourceSpy *dataSpy = [[DataSourceSpy alloc] init];
    self.sut.dataSource = dataSpy;
    [self.sut fetchAllItemsWithCompletion:nil];
    XCTAssertTrue(dataSpy.didReceiveFetchItemsMessage, @"Should have called fetch Items on the data source");
}

- (void)testCallingFetchItemsOnItemRepositoryTransmitsTheCallToDataSource {
    DataSourceSpy *dataSpy = [[DataSourceSpy alloc] init];
    self.sut.dataSource = dataSpy;
    [self.sut fetchAllItemsWithCompletion:nil];
    XCTAssertTrue(dataSpy.didReceiveFetchItemsMessage, @"Should have called fetch Items on the data source");
}

- (void)testItemRepositoryReturnsCorrectItems {
    BOOL dataReceived = NO;
    [self.sut fetchAllItemsWithCompletion:^(NSArray *items) {
        XCTAssertEqualObjects(items, self.items, @"Items in the repository should be identical to those received from the data source");
    }];
    [TestHelpers waitFor:&dataReceived timeout:1];
}

- (void)testRepositoryReturnsCorrectItemForItemForId {
    Item *firstItem = self.items[0];
    Item *retrievedItem = [self.sut itemForId:firstItem.itemId];
    XCTAssertEqualObjects(firstItem, retrievedItem, @"Items should be the same");
}

- (void)testRepositoryReturnsNilForNonExistingItemId {
    Item *retrievedItem = [self.sut itemForId:@"bla"];
    XCTAssertNil(retrievedItem, @"Item should be nil");
}

- (void)testRepositorySelectsCorrectItemForValidId {
    [self.sut selectItemForId:@"1"];
    XCTAssertEqualObjects([self.sut selectedItem], self.items[0],@"Should have selected the first item");
}

- (void)testRepositoryReturnsNilWhenSelectingAnItemWithInvalidId {
    [self.sut selectItemForId:@"Blah"];
    XCTAssertNil([self.sut selectedItem], @"The selected item should be nil");
}

@end
