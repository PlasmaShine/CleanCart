//
//  NavigatorFactoryTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NavigatorFactory.h"
#import "NavigationMessage.h"
#import "ListItemsViewController.h"
#import "ListItemsPresenter.h"
#import "ItemDetailsViewController.h"
#import "ItemDetailsPresenter.h"

@interface NavigatorFactoryTests : XCTestCase

@property (nonatomic, strong) NavigatorFactory *sut;
@end

@implementation NavigatorFactoryTests

- (void)setUp {
    [super setUp];
    self.sut = [[NavigatorFactory alloc] init];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

#pragma mark - Tests -

- (void)testListItemsNavigatorIsCorrectlySetUp {
    Navigator *navigator = [self.sut navigatorForMessage:NavigationMessageRoot];
    UINavigationController *navController = (UINavigationController *)navigator.rootViewController;
    ListItemsViewController *listItemsVc = (ListItemsViewController *)navController.viewControllers[0];
    ListItemsPresenter *presenter = (ListItemsPresenter *)listItemsVc.eventHandler;
    XCTAssertNotNil(navigator.navigatorFactory, @"Navigator factory should not be nil");
    XCTAssertNotNil(navigator.rootViewController, @"Root view controller should not be nil");
    XCTAssertNotNil(listItemsVc, @"List items view controller should not be nil");
    XCTAssertNotNil(listItemsVc.eventHandler, @"Event handler should not be nil");
    XCTAssertEqualObjects(listItemsVc.eventHandler, presenter,@"Presenter should be the event handler");
    XCTAssertEqualObjects(presenter.delegate, listItemsVc, "View countroller should be the delegate of the presenter");
    XCTAssertEqualObjects(presenter.navigator, navigator, @"Presenter should have a navigator");
    XCTAssertNotNil(presenter.transactionFactory, @"Presenter should have a transaction factory");
}

- (void)testShowItemDetailsIsCorrectlySetUp {
    Navigator *navigator = [self.sut navigatorForMessage:NavigationMessageShowItemDetails];
     ItemDetailsViewController *viewController = (ItemDetailsViewController *)navigator.rootViewController;
    ItemDetailsPresenter *presenter = (ItemDetailsPresenter *)viewController.eventHandler;
    XCTAssertNotNil(navigator.navigatorFactory, @"Navigator factory should not be nil");
    XCTAssertNotNil(navigator.rootViewController, @"Root view controller should not be nil");
    XCTAssertNotNil(viewController, @"Itemdetails view controller should not be nil");
    XCTAssertNotNil(viewController.eventHandler, @"Event handler should not be nil");
    XCTAssertEqualObjects(viewController.eventHandler, presenter,@"Presenter should be the event handler");
    XCTAssertEqualObjects(presenter.delegate, viewController, "View countroller should be the delegate of the presenter");
    XCTAssertEqualObjects(presenter.navigator, navigator, @"Presenter should have a navigator");
    XCTAssertNotNil(presenter.transactionFactory, @"Presenter should have a transaction factory");
}

@end
