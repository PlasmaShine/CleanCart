//
//  ItemDetailsViewController.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ItemDetailsPresenterIO.h"
#import "ItemDetailsViewController.h"
#import "ItemDetailsPresenterSpy.h"

@interface ItemDetailsViewControllerTests : XCTestCase

@property(nonatomic, strong) ItemDetailsViewController *sut;

@end

@implementation ItemDetailsViewControllerTests

- (void)setUp {
    [super setUp];
    self.sut = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ItemDetailsViewController"];
    [self.sut.view layoutIfNeeded];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

#pragma mark - Helpers -

- (PresentableItemDetails *)_createTestItem {
    PresentableItemDetails *itemDetails =[[PresentableItemDetails alloc] init];
    itemDetails.itemId = @"1";
    itemDetails.itemName = @"Item1";
    itemDetails.itemDescription = @"Item1 description";
    itemDetails.itemPrice = @"Item1 price";
    itemDetails.itemStock = @"Item1 stock";
    return itemDetails;
}

#pragma mark - Tests -

- (void)testViewControllerConformsToProperProtocol {
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(ItemDetailsPresenterResponse)]);
}

- (void)testViewDidLoadCallsEventHandlerToFetchItemToPresent{
    ItemDetailsPresenterSpy *presenterSpy = [[ItemDetailsPresenterSpy alloc] init];
    self.sut.eventHandler = presenterSpy;
    [self.sut viewDidLoad];
    XCTAssertTrue(presenterSpy.didCallFetchItemToPresent, @"Should have called fetchItemsToPresent on the ecent handler");
}

- (void)testItemDetailsAreProperlyDisplayed {
    PresentableItemDetails *itemDetails = [self _createTestItem];
    [self.sut presentItemDetails:itemDetails];
    XCTAssertEqualObjects(self.sut.itemName.text, itemDetails.itemName, @"Item name should match");
    XCTAssertEqualObjects(self.sut.itemDescription.text, itemDetails.itemDescription, @"Item description should match");
    XCTAssertEqualObjects(self.sut.itemPrice.text, itemDetails.itemPrice, @"Item price should match");
    XCTAssertEqualObjects(self.sut.itemStock.text, itemDetails.itemStock, @"Item stock should match");
}

- (void)testViewWillAppearSendsMessageToEventHandler {
    ItemDetailsPresenterSpy *presenterSpy = [[ItemDetailsPresenterSpy alloc] init];
    self.sut.eventHandler = presenterSpy;
    [self.sut viewWillAppear:YES];
    XCTAssertTrue(presenterSpy.didReceiveViewWillAppearMessage, @"Event handler should have received viewWillAppear message");
}

- (void)testViewWillDisappearSendsMessageToEventHandler {
    ItemDetailsPresenterSpy *presenterSpy = [[ItemDetailsPresenterSpy alloc] init];
    self.sut.eventHandler = presenterSpy;
    [self.sut viewWillDisappear:YES];
    XCTAssertTrue(presenterSpy.didReceiveViewWillDisappearMessage, @"Event handler should have received viewWillAppear message");
}

@end
