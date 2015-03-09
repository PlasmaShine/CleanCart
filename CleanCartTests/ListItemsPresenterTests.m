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
#import "DisplayListItem.h"
#import "Section.h"
#import "NavigationMessage.h"
#import "NavigatorSpy.h"
#import "SpyTransactionFactory.h"
#import "Item.h"

@interface ListItemsPresenterTests : XCTestCase

@property (nonatomic, strong) ListItemsPresenter *sut;
@property (nonatomic, strong) ListItemsViewControllerSpy *viewControllerSpy ;
@property (nonatomic, strong) NavigatorSpy *navigatorSpy ;
@property (nonatomic, strong) Item *item1;
@property (nonatomic, strong) Item *item2;
@property (nonatomic, strong) Item *item3;

@end

@implementation ListItemsPresenterTests

- (void)setUp {
    [super setUp];
    self.sut = [[ListItemsPresenter alloc] init];
    self.viewControllerSpy = [[ListItemsViewControllerSpy alloc] init];
    self.navigatorSpy = [[NavigatorSpy alloc] init];
    self.sut.navigator = self.navigatorSpy;
    self.sut.delegate = self.viewControllerSpy;
    self.item1 = [[Item alloc] init];
    self.item1.itemId = @"1";
    self.item1.itemName = @"Item 1 name";
    self.item1.itemPrice = 300;
    self.item1.itemStock = 44;
    self.item1.itemDescription = @"Item 1 description";
    self.item2 = [[Item alloc] init];
    self.item3 = [[Item alloc] init];
}

- (void)tearDown {
    self.sut.delegate = nil;
    self.sut = nil;
    self.navigatorSpy = nil;
    [super tearDown];
}
#pragma mark - Helpers -

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
    SpyTransactionFactory *spyFactory = [[SpyTransactionFactory alloc] init];
    self.sut.transactionFactory = spyFactory;
    [self.sut fetchData];
    ListItemsTransactionSpy *listItemsTransactionSpy = (ListItemsTransactionSpy *)spyFactory.currentTransaction;
    XCTAssertTrue(listItemsTransactionSpy.didReceiveExecuteMessage, @"Presenter should have called execute on ListItemsTransaction");
}

- (void)testReceivingItemsFromTransactionCallsUIRefresh {
    ListItemsViewControllerSpy *viewControllerSpy = [[ListItemsViewControllerSpy alloc] init];
    self.sut.delegate = viewControllerSpy;
    [self.sut didReceiveItems:[NSArray arrayWithObject:self.item1]];
    XCTAssertTrue(viewControllerSpy.didReceiveRefreshUIMessage, @"Receiving new objects from the iteractor should have called refreshUI");
}

- (void)testReceivingEmptyArrayFromTransactionDoesNotCallUIRefresh {
    ListItemsViewControllerSpy *viewControllerSpy = [[ListItemsViewControllerSpy alloc] init];
    self.sut.delegate = viewControllerSpy;
    [self.sut didReceiveItems:[NSArray array]];
    XCTAssertFalse(viewControllerSpy.didReceiveRefreshUIMessage, @"Receiving empty object array from the iteractor should not have called refreshUI");
}

- (void)testPresenterSendsReceivedDataAsArrayOfSections {
    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, nil];
    [self.sut didReceiveItems:itemArray];
    XCTAssertTrue([self.viewControllerSpy.receivedItems[0] isKindOfClass:[Section class]], @"Presenter should have sent items to UI as a section array");
}

- (void)testEachSectionContainsOnlyDisplayItems {
    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, nil];
    [self.sut didReceiveItems:itemArray];
    Section *section = self.viewControllerSpy.receivedItems[0];
    XCTAssertTrue([section.items[0] isKindOfClass:[DisplayListItem class]]);
    DisplayListItem *displayItem = section.items[0];
    XCTAssertEqualObjects(self.item1.itemId, displayItem.itemId, @"Items should have the same item Id");
    XCTAssertEqualObjects(self.item1.itemName, displayItem.itemName, @"Items should have the same item name");
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

- (void)testReceivingItemTappedMessagePasesItOnToTheNavigator {
    [self.sut didSelectItemWithId:@"1"];
    XCTAssertEqual(self.navigatorSpy.receivedMessage, NavigationMessageShowItemDetails, @"Should have received show item details message");
}

@end
