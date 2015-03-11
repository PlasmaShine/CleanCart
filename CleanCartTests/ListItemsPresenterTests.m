//
//  ListItemsPresenterTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/27/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ListItemsPresenter.h"
#import "ListItemsTransactionIO.h"
#import "ListItemsPresenterIO.h"
#import "ListItemsTransactionSpy.h"
#import "ListItemsViewControllerSpy.h"
#import "PresentableListItem.h"
#import "Section.h"
#import "NavigationMessage.h"
#import "NavigatorSpy.h"
#import "SpyTransactionFactory.h"
#import "Item.h"
#import "SelectItemTransactionSpy.h"
#import "NumberOfItemsInCartTransactionSpy.h"

@interface ListItemsPresenterTests : XCTestCase

@property (nonatomic, strong) ListItemsPresenter *sut;
@property (nonatomic, strong) ListItemsViewControllerSpy *viewControllerSpy ;
@property (nonatomic, strong) NavigatorSpy *navigatorSpy ;
@property (nonatomic, strong) Item *item1;
@property (nonatomic, strong) Item *item2;
@property (nonatomic, strong) Item *item3;
@property (nonatomic, strong) SpyTransactionFactory *spyFactory;

@end

@implementation ListItemsPresenterTests

- (void)setUp {
    [super setUp];
    self.sut = [[ListItemsPresenter alloc] init];
    self.viewControllerSpy = [[ListItemsViewControllerSpy alloc] init];
    self.spyFactory = [[SpyTransactionFactory alloc] init];
    self.navigatorSpy = [[NavigatorSpy alloc] init];
    self.sut.navigator = self.navigatorSpy;
    self.sut.delegate = self.viewControllerSpy;
    self.sut.transactionFactory = self.spyFactory;
    [self _createTestData];
}

- (void)tearDown {
    self.viewControllerSpy = nil;
    self.navigatorSpy = nil;
    self.spyFactory = nil;
    self.item1 = nil;
    self.item2 = nil;
    self.item3 = nil;
    self.sut = nil;
    [super tearDown];
}
#pragma mark - Helpers -

- (void)_createTestData {
    self.item1 = [[Item alloc] init];
    self.item1.itemId = @"1";
    self.item1.itemName = @"Item 1 name";
    self.item1.itemPrice = 300;
    self.item1.itemStock = 44;
    self.item1.itemDescription = @"Item 1 description";
    self.item2 = [[Item alloc] init];
    self.item3 = [[Item alloc] init];
}

- (void)_assert:(NSInteger)numberOfSections sectionsForItems:(NSArray *)items {
    XCTAssertEqual(self.viewControllerSpy.receivedItems.count, numberOfSections, @"Incorect number of sections");
}

- (void)_assert:(NSInteger)numberOfItems itemsForSection:(NSInteger)sectionNumber {
    Section *section = self.viewControllerSpy.receivedItems[sectionNumber];
    XCTAssertEqual(section.items.count, numberOfItems, @"Incorrect number of items in section");
}

#pragma mark - Tests -

- (void)testPresenterConformsToProperProtocols {
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(ListItemsTransactionResponse)], @"");
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(ListItemsPresenterRequest)]);
}

- (void)testFetchItemsSignalCallsListItemsTransaction {
    [self.sut fetchData];
    ListItemsTransactionSpy *listItemsTransactionSpy = (ListItemsTransactionSpy *)self.spyFactory.currentTransaction;
    XCTAssertTrue(listItemsTransactionSpy.didReceiveExecuteMessage, @"Presenter should have called execute on ListItemsTransaction");
}

- (void)testViewWillAppearCallsNumberOfItemsInCartTransaction {
    [self.sut viewWillAppear];
    NumberOfItemsInCartTransactionSpy *numberOfItemsTransactionSpy = (NumberOfItemsInCartTransactionSpy *)self.spyFactory.currentTransaction;
    XCTAssertTrue(numberOfItemsTransactionSpy.didCallExecute, @"Presenter should have called execute on NumberOfItemsInCartTransaction");
}

- (void)testReceivingAddToCartCallsNumberOfItemsInCartTransaction {
    [self.sut addToCartItemWithId:nil];
    NumberOfItemsInCartTransactionSpy *numberOfItemsTransactionSpy = (NumberOfItemsInCartTransactionSpy *)self.spyFactory.currentTransaction;
    XCTAssertTrue(numberOfItemsTransactionSpy.didCallExecute, @"Presenter should have called execute on NumberOfItemsInCartTransaction");
}

- (void)testReceivingNumberOfItemsInCartPassesItOnToTheViewController {
    [self.sut numberOfItemsCurrentlyInCart:2];
    XCTAssertTrue(self.viewControllerSpy.didReceiveNumberOfItemsInCartMessage, @"Receiving the number of items in the cart should have passed it on to the UI");
}

- (void)testReceivingItemsFromTransactionCallsUIRefresh {
    [self.sut didReceiveItems:[NSArray arrayWithObject:self.item1]];
    XCTAssertTrue(self.viewControllerSpy.didReceiveRefreshUIMessage, @"Receiving new objects from the iteractor should have called refreshUI");
}

- (void)testReceivingEmptyArrayFromTransactionDoesNotCallUIRefresh {
    [self.sut didReceiveItems:[NSArray array]];
    XCTAssertFalse(self.viewControllerSpy.didReceiveRefreshUIMessage, @"Receiving empty object array from the iteractor should not have called refreshUI");
}

- (void)testPresenterSendsReceivedDataAsArrayOfSections {
    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, nil];
    [self.sut didReceiveItems:itemArray];
    XCTAssertTrue([self.viewControllerSpy.receivedItems[0] isKindOfClass:[Section class]], @"Presenter should have sent items to UI as a section array");
}

- (void)testEachSectionContainsOnlyPresentableItems {
    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, nil];
    [self.sut didReceiveItems:itemArray];
    Section *section = self.viewControllerSpy.receivedItems[0];
    XCTAssertTrue([section.items[0] isKindOfClass:[PresentableListItem class]]);
    PresentableListItem *presentableItem = section.items[0];
    XCTAssertEqualObjects(self.item1.itemId, presentableItem.itemId, @"Items should have the same item Id");
    XCTAssertEqualObjects(self.item1.itemName, presentableItem.itemName, @"Items should have the same item name");
}

- (void)testOneItemHasOnlyOneSection {
    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, nil];
    [self.sut didReceiveItems:itemArray];
    [self _assert:1 sectionsForItems:itemArray];
    [self _assert:1 itemsForSection:0];
}

- (void)testTwoItemsHaveOnlyOneSection {
    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, self.item2, nil];
    [self.sut didReceiveItems:itemArray];
    [self _assert:1 sectionsForItems:itemArray];
    [self _assert:2 itemsForSection:0];
}

- (void)testThreeItemsHaveTwoSections {
    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, self.item2, self.item3, nil];
    [self.sut didReceiveItems:itemArray];
    [self _assert:2 sectionsForItems:itemArray];
    [self _assert:2 itemsForSection:0];
    [self _assert:1 itemsForSection:1];
}

#pragma mark - Navigation message handling -

- (void)testReceivingCartTappedMessagePasesItOnToTheNavigator {
    [self.sut cartButtonTapped];
    XCTAssertEqual(self.navigatorSpy.receivedMessage, NavigationMessageShowCart, @"Should have received show cart message");
}

- (void)testReceivingItemTappedMessageCallsExecuteOnSelectItemTransaction {
    [self.sut didSelectItemWithId:@"1"];
    XCTAssertTrue([self.spyFactory.currentTransaction isKindOfClass:[SelectItemTransaction class]]);
    SelectItemTransactionSpy *transaction = (SelectItemTransactionSpy *)self.spyFactory.currentTransaction;
    XCTAssertEqualObjects(transaction.itemId, @"1", @"Item ID should have been passed to the transaction");
    XCTAssertTrue(transaction.didCallExecute , @"Should have called execute on the transaction");
}

- (void)testReceivingItemTappedMessagePasesItOnToTheNavigator {
    [self.sut didSelectItemWithId:@"1"];
    XCTAssertEqual(self.navigatorSpy.receivedMessage, NavigationMessageShowItemDetails, @"Should have received show item details message");
}

@end
