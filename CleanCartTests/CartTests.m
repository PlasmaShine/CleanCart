//
//  CartTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Cart.h"
#import "Item.h"

@interface CartTests : XCTestCase

@property (nonatomic, strong) Cart *sut;
@property (nonatomic, strong) Item *item1;
@property (nonatomic, strong) Item *item2;

@end

@implementation CartTests

- (void)setUp {
    [super setUp];
    self.sut = [[Cart alloc] init];
    self.item1 = [[Item alloc] init];
    self.item2 = [[Item alloc] init];
}

- (void)tearDown {
    self.sut = nil;
    self.item1 = nil;
    self.item2 = nil;
    [super tearDown];
}

#pragma mark - Tests -

- (void)testAddingOneItemToCart {
    [self.sut addItemToCart:self.item1];
    NSArray *cartItems = [self.sut itemsInCart];
    XCTAssertEqual(cartItems.count, 1, @"There should be 1 item in the cart");
    XCTAssertEqualObjects(cartItems[0], self.item1, @"Items should match");
}

- (void)testAddingTwoItemsToCart {
    [self.sut addItemToCart:self.item1];
    [self.sut addItemToCart:self.item2];
    NSArray *cartItems = [self.sut itemsInCart];
    XCTAssertEqual(cartItems.count, 2, @"There should be 2 item in the cart");
    XCTAssertTrue([cartItems containsObject:self.item1], @"Item should be in the cart");
    XCTAssertTrue([cartItems containsObject:self.item2], @"Item should be in the cart");
}

- (void)testCanRemoveItemsFromCart {
    [self.sut addItemToCart:self.item1];
    [self.sut removeItemFromCart:self.item1];
    NSArray *cartItems = [self.sut itemsInCart];
    XCTAssertEqual(cartItems.count, 0, @"There should only be 0 item in the cart");
}

- (void)testRemovingNonExistentItemHasNoEffect {
    [self.sut addItemToCart:self.item1];
    [self.sut removeItemFromCart:self.item2];
    NSArray *cartItems = [self.sut itemsInCart];
    XCTAssertEqual(cartItems.count, 1, @"There should be 1 item in the cart");
}

@end
