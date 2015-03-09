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

@interface ItemDetailsViewControllerTests : XCTestCase

@property(nonatomic, strong) ItemDetailsViewController *sut;

@end

@implementation ItemDetailsViewControllerTests

- (void)setUp {
    [super setUp];
    self.sut = [[ItemDetailsViewController alloc] init];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

#pragma mark - Tests -

- (void)testViewControllerConformsToProperProtocol {
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(ItemDetailsPresenterResponse)]);
}

@end
