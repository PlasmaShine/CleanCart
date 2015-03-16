//
//  ItemDetailsPresenterTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ItemDetailsPresenter.h"
#import "ItemDetailsTransactionIO.h"
#import "ItemDetailsViewControllerSpy.h"
#import "SpyTransactionFactory.h"
#import "TransactionSpy.h"

@interface ItemDetailsPresenterTests : XCTestCase

@property (nonatomic, strong) ItemDetailsPresenter *sut;

@end

@implementation ItemDetailsPresenterTests

- (void)setUp {
    [super setUp];
    self.sut = [[ItemDetailsPresenter alloc] init];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

#pragma mark - Helpers -

- (Item *)_createTestItem {
    Item *item = [[Item alloc] init];
    item.itemId = @"1";
    item.itemName = @"Item name";
    item.itemPrice = 1200;
    item.itemStock = 3;
    item.itemDescription = @"Item description";
    return item;
}

#pragma mark - Tests -

- (void)testPresenterConformsToProperPrtocols {
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(ItemDetailsTransactionResponse)], @"Presenter should conform to proper protocol");
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(ItemDetailsPresenterRequest)], @"Presenter should conform to proper protocol");
}

- (void)testItemReceivedFromTransactionIsSentToViewControllerAsPresentableItemDetail {
    Item *item = [self _createTestItem];
    ItemDetailsViewControllerSpy *viewControllerSpy = [[ItemDetailsViewControllerSpy alloc] init];
    self.sut.delegate = viewControllerSpy;
    [self.sut presentItem:item];
    XCTAssertTrue(viewControllerSpy.didReceiveItemForPresentation, @"Should have received the item");
    XCTAssertTrue([viewControllerSpy.receivedItem isKindOfClass:[PresentableItemDetails class]]);
    XCTAssertEqualObjects(item.itemId, viewControllerSpy.receivedItem.itemId, @"Item ids should be the same");
    XCTAssertEqualObjects(item.itemName, viewControllerSpy.receivedItem.itemName, @"Item names should be the same");
    XCTAssertEqualObjects(item.itemDescription, viewControllerSpy.receivedItem.itemDescription, @"Item descriptions should be the same");
}

- (void)testReceivingFetchItemDetailsCallsTransaction {
    SpyTransactionFactory *spyFactory = [[SpyTransactionFactory alloc] init];
    self.sut.transactionFactory = spyFactory;
    [self.sut fetchItemToPresent];
    TransactionSpy *transactionSpy = (TransactionSpy *)spyFactory.currentTransaction;
    XCTAssertTrue(transactionSpy.didCallExecute, @"Should have called execute on the transaction");
}

@end
