//
//  ListItemsViewControllerTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/2/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ListitemsViewController.h"
#import <UIKit/UIKit.h>
#import "ListItemsPresenterIO.h"

@interface ListItemsViewControllerTests : XCTestCase

@end

@implementation ListItemsViewControllerTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - Tests

- (void)testViewControllerConformsToProperProtocols {
    ListItemsViewController *sut = [[ListItemsViewController alloc] init];
    XCTAssertTrue([sut conformsToProtocol:@protocol(ListItemsPresenterResponse)], @"ViewController should conform to the proper protocol");
}

- (void)testLoadingTheViewSendsViewLoadMessageToPresenter {
    
}


@end
