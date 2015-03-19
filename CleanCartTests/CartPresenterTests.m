//
//  CartPresenterTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/16/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CartPresenter.h"
#import "TransactionSpy.h"
#import "SpyTransactionFactory.h"
#import "Item.h"
#import "CartViewControllerSpy.h"
#import "Section.h"
#import "PresentableCartItem.h"

@interface CartPresenterTests : XCTestCase

@property (nonatomic, strong) CartPresenter *sut;
@property (nonatomic, strong) SpyTransactionFactory *spyFactory;
@property (nonatomic, strong) Item *item1;
@property (nonatomic, strong) CartViewControllerSpy *viewControllerSpy;

@end

@implementation CartPresenterTests

- (void)setUp {
    self.sut = [[CartPresenter alloc] init];
    self.spyFactory = [[SpyTransactionFactory alloc] init];
    self.sut.transactionFactory = self.spyFactory;
    self.item1 = [[Item alloc] init];
    self.viewControllerSpy = [[CartViewControllerSpy alloc] init];
    self.sut.delegate = self.viewControllerSpy;
    [super setUp];
}

- (void)tearDown {
    self.sut = nil;
    self.spyFactory = nil;
    self.item1 = nil;
    [super tearDown];
}


#pragma mark - Tests -

- (void)testPresenterConformsToProperProtocols {
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(ListCartItemsTransactionResponse)], @"");
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(CartPresenterRequest)]);
}

- (void)testFetchItemsSignalCallsListItemsTransaction {
    [self.sut fetchData];
    TransactionSpy *listCartItemsTransactionSpy = (TransactionSpy *)self.spyFactory.currentTransaction;
    XCTAssertTrue(listCartItemsTransactionSpy.didCallExecute, @"Presenter should have called execute on ListCartItemsTransaction");
}

- (void)testReceivingItemsFromTransactionCallsUIRefresh {
    [self.sut didReceiveCartItems:[NSArray arrayWithObject:self.item1]];
    XCTAssertTrue(self.viewControllerSpy.didReceiveRefreshUIMessage, @"Receiving new objects from the iteractor should have called refreshUI");
}

- (void)testReceivingEmptyArrayFromTransactionDoesNotCallUIRefresh {
    [self.sut didReceiveCartItems:[NSArray array]];
    XCTAssertFalse(self.viewControllerSpy.didReceiveRefreshUIMessage, @"Receiving empty object array from the iteractor should not have called refreshUI");
}

- (void)testPresenterSendsReceivedDataAsArrayOfSections {
    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, nil];
    [self.sut didReceiveCartItems:itemArray];
    XCTAssertTrue([self.viewControllerSpy.receivedItems[0] isKindOfClass:[Section class]], @"Presenter should have sent items to UI as a section array");
}

//- (void)testEachSectionContainsOnlyPresentableItems {
//    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, nil];
//    [self.sut didReceiveCartItems:itemArray];
//    Section *section = self.viewControllerSpy.receivedItems[0];
//    XCTAssertTrue([section.items[0] isKindOfClass:[PresentableCartItem class]]);
//    PresentableCartItem *presentableItem = section.items[0];
//    XCTAssertEqualObjects(self.item1.itemId, presentableItem.itemId, @"Items should have the same item Id");
//    XCTAssertEqualObjects(self.item1.itemName, presentableItem.itemName, @"Items should have the same item name");
//}

//- (void)testOneItemHasOnlyOneSection {
//    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, nil];
//    [self.sut didReceiveItems:itemArray];
//    [self _assert:1 sectionsForItems:itemArray];
//    [self _assert:1 itemsForSection:0];
//}
//
//- (void)testTwoItemsHaveOnlyOneSection {
//    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, self.item2, nil];
//    [self.sut didReceiveItems:itemArray];
//    [self _assert:1 sectionsForItems:itemArray];
//    [self _assert:2 itemsForSection:0];
//}
//
//- (void)testThreeItemsHaveTwoSections {
//    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, self.item2, self.item3, nil];
//    [self.sut didReceiveItems:itemArray];
//    [self _assert:2 sectionsForItems:itemArray];
//    [self _assert:2 itemsForSection:0];
//    [self _assert:1 itemsForSection:1];
//}
//
//#pragma mark - Number of items in cart -
//
//- (void)testViewWillAppearCallsNumberOfItemsInCartTransaction {
//    [self.sut viewWillAppear];
//    NumberOfItemsInCartTransactionSpy *numberOfItemsTransactionSpy = (NumberOfItemsInCartTransactionSpy *)self.spyFactory.currentTransaction;
//    XCTAssertTrue(numberOfItemsTransactionSpy.didCallExecute, @"Presenter should have called execute on NumberOfItemsInCartTransaction");
//}
//
//- (void)testReceivingAddToCartCallsNumberOfItemsInCartTransaction {
//    [self.sut addToCartItemWithId:nil];
//    NumberOfItemsInCartTransactionSpy *numberOfItemsTransactionSpy = (NumberOfItemsInCartTransactionSpy *)self.spyFactory.currentTransaction;
//    XCTAssertTrue(numberOfItemsTransactionSpy.didCallExecute, @"Presenter should have called execute on NumberOfItemsInCartTransaction");
//}
//
//- (void)testReceivingNumberOfItemsInCartPassesItOnToTheViewController {
//    [self.sut numberOfItemsCurrentlyInCart:2];
//    XCTAssertTrue(self.viewControllerSpy.didReceiveNumberOfItemsInCartMessage, @"Receiving the number of items in the cart should have passed it on to the UI");
//}
//
//#pragma mark - Add to cart -
//
//
//#pragma mark - Navigation message handling -
//
//- (void)testReceivingCartTappedMessagePassesItOnToTheNavigator {
//    [self.sut cartButtonTapped];
//    XCTAssertEqual(self.navigatorSpy.receivedMessage, NavigationMessageShowCart, @"Should have received show cart message");
//}
//
//- (void)testReceivingItemTappedMessageCallsExecuteOnSelectItemTransaction {
//    [self.sut didSelectItemWithId:@"1"];
//    XCTAssertTrue([self.spyFactory.currentTransaction isKindOfClass:[SelectItemTransaction class]]);
//    SelectItemTransactionSpy *transaction = (SelectItemTransactionSpy *)self.spyFactory.currentTransaction;
//    XCTAssertEqualObjects(transaction.itemId, @"1", @"Item ID should have been passed to the transaction");
//    XCTAssertTrue(transaction.didCallExecute , @"Should have called execute on the transaction");
//}
//
//- (void)testReceivingItemTappedMessagePassesItOnToTheNavigator {
//    [self.sut didSelectItemWithId:@"1"];
//    XCTAssertEqual(self.navigatorSpy.receivedMessage, NavigationMessageShowItemDetails, @"Should have received show item details message");
//}

@end
