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

@interface CartPresenterTests : XCTestCase

@property (nonatomic, strong) CartPresenter *sut;

@end

@implementation CartPresenterTests

- (void)setUp {
    self.sut = [[CartPresenter alloc] init];
    [super setUp];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

- (void)testPresenterConformsToProperProtocol {
}

@end
