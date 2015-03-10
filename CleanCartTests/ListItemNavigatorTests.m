//
//  ListItemNavigatorTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/10/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ListItemsNavigator.h"
#import "SpyNavigatorFactory.h"
#import "NavigatorSpy.h"

@interface ListItemNavigatorTests : XCTestCase

@property (nonatomic, strong) ListItemsNavigator *sut;

@end

@implementation ListItemNavigatorTests

- (void)setUp {
    [super setUp];
    self.sut = [[ListItemsNavigator alloc] init];
    
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

#pragma mark - Tests -

- (void)testReceivingItemDetailsNavigationMessagePresentationMethodIsCalledOnItemdetailsNavigator {
    SpyNavigatorFactory *spyFactory = [[SpyNavigatorFactory alloc] init];
    self.sut.navigatorFactory = spyFactory;
    [self.sut performNavigationForMessage:NavigationMessageShowItemDetails];
    NavigatorSpy *navigatorSpy = (NavigatorSpy *)spyFactory.createdNavigator;
    XCTAssertTrue(navigatorSpy.didReceivePresentViewControllerMessage, @"Should have received present vievController call");
}

@end
