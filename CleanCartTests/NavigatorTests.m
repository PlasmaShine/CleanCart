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
#import "SpyNavigatorFactory.h"
#import "NavigatorSpy.h"

@interface NavigatorTests : XCTestCase

@property (nonatomic, strong) Navigator *sut;
@end

@implementation NavigatorTests

- (void)setUp {
    self.sut = [[Navigator alloc] init];
    [super setUp];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

#pragma mark - Tests -

- (void)testReceivingNavigationMessagePassesItOnToNavigatorFactory {
    NavigatorFactorySpy *factorySpy = [[NavigatorFactorySpy alloc] init];
    self.sut.navigatorFactory = factorySpy;
    [self.sut performNavigationForMessage:NavigationMessageNone];
    XCTAssertTrue(factorySpy.didReceiveNavigationMessage, @"Should have received navigation message");
    [self.sut performNavigationForMessage:NavigationMessageRoot];
    XCTAssertEqual(factorySpy.receivedMessage, NavigationMessageRoot, @"Should have received correct NavigationMessageRoot");
}

- (void)testReceivingNavigationMessagePresentationMethodIsCalledOnItemDetailsNavigator {
    SpyNavigatorFactory *spyFactory = [[SpyNavigatorFactory alloc] init];
    self.sut.navigatorFactory = spyFactory;
    [self.sut performNavigationForMessage:NavigationMessageShowItemDetails];
    NavigatorSpy *navigatorSpy = (NavigatorSpy *)spyFactory.createdNavigator;
    XCTAssertTrue(navigatorSpy.didReceivePresentViewControllerMessage, @"Should have received present vievController call");
}

@end
