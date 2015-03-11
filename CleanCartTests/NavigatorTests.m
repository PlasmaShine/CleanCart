//
//  NavigatorTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Navigator.h"
#import "NavigatorFactorySpy.h"
#import "NavigationMessage.h"

@interface NavigatorTests : XCTestCase

@end

@implementation NavigatorTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - Tests -

- (void)testReceivingNavigationMessagePassesItOnToNavigatorFactory {
    Navigator *navigator = [[Navigator alloc] init];
    NavigatorFactorySpy *factorySpy = [[NavigatorFactorySpy alloc] init];
    navigator.navigatorFactory = factorySpy;
    [navigator performNavigationForMessage:NavigationMessageNone];
    XCTAssertTrue(factorySpy.didReceiveNavigationMessage, @"Should have received navigation message");
    [navigator performNavigationForMessage:NavigationMessageRoot];
    XCTAssertEqual(factorySpy.receivedMessage, NavigationMessageRoot, @"Should have received correct NavigationMessageRoot");
}

@end
