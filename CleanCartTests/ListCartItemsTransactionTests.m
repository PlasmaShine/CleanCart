//
//  ListCartItemsTransactionTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/16/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ListCartItemsTransaction.h"
#import "CartSpy.h"
#import "CartStub.h"
#import "CartPresenterSpy.h"

@interface ListCartItemsTransactionTests : XCTestCase

@property (nonatomic, strong) ListCartItemsTransaction *sut;

@end

@implementation ListCartItemsTransactionTests

- (void)setUp {
    [super setUp];
    self.sut = [[ListCartItemsTransaction alloc] init];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

#pragma mark - Tests -

- (void)testCallingExecuteCallsAllItemsMethodOnThecart {
    CartSpy *cartSpy = [[CartSpy alloc] init];
    self.sut.cart = cartSpy;
    [self.sut execute];
    XCTAssertTrue(cartSpy.didReceiveItemsInCartMessage, @"Should have called itemsInCart method");
}

- (void)testCallingExecuteReturnsCartContentsToDelegate {
    CartStub *cartStub= [[CartStub alloc] init];
    Item *item = [[Item alloc] init];
    NSArray *items = [NSArray arrayWithObjects:item, nil];
    cartStub.cartItems = items;
    self.sut.cart = cartStub;
    CartPresenterSpy *presenterSpy = [[CartPresenterSpy alloc] init];
    self.sut.delegate = presenterSpy;
    [self.sut execute];
    XCTAssertTrue(presenterSpy.didReceiveCartItems, @"Should have received cart items");
    XCTAssertEqualObjects(items, presenterSpy.receivedItems, @"Should have received cart items");
}

@end
