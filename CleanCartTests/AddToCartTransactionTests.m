//
//  AddToCartTransactionTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CartSpy.h"
#import "ItemRepositorySpy.h"
#import "AddToCartTransaction.h"
#import "ItemRepositoryStub.h"

@interface AddToCartTransactionTests : XCTestCase

@property (nonatomic, strong) AddToCartTransaction *sut;
@property (nonatomic, strong) CartSpy *cartSpy;
@property (nonatomic, strong) ItemRepositorySpy *repositorySpy;
@property (nonatomic, strong) ItemRepositoryStub *stubRepository;
@property (nonatomic, strong) Item *item;


@end

@implementation AddToCartTransactionTests
- (void)setUp {
    [super setUp];
    self.sut = [[AddToCartTransaction alloc] init];
    self.cartSpy = [[CartSpy alloc] init];
    self.sut.cart = self.cartSpy;
    self.repositorySpy = [[ItemRepositorySpy alloc] init];
    self.sut.itemRepository = self.repositorySpy;
    self.item = [[Item alloc] init];
    self.item.itemId = @"1";
    self.stubRepository = [[ItemRepositoryStub alloc] init];
    self.stubRepository.item = self.item;
}

- (void)tearDown {
    self.item = nil;
    self.cartSpy = nil;
    self.repositorySpy = nil;
    self.stubRepository = nil;
    self.sut = nil;
    [super tearDown];
}

- (void)testCallingExecuteSendsItemWithIdMessageToCart {
    [self.sut execute];
    XCTAssertTrue(self.repositorySpy.didReceiveItemForIdMessage, @"Should have received itemForId message");
}

- (void)testCallingExecuteWithCorrectItemIdAdsItemToCart {
    self.sut.itemRepository = self.stubRepository;
    self.sut.itemId = self.item.itemId;
    [self.sut execute];
    XCTAssertTrue(self.cartSpy.didReceiveAddToCartMessage, @"Should have received addToCart message");
    XCTAssertEqualObjects(self.cartSpy.itemAddedToCart, self.item, @"Should have addd item to cart");
}

- (void)testCallingExecuteWithIncorrectItemIdDoesNotAdItemToCart {
    self.sut.itemRepository = self.stubRepository;
    self.sut.itemId = @"Blah";
    [self.sut execute];
    XCTAssertFalse(self.cartSpy.didReceiveAddToCartMessage, @"Should have received addToCart message");
    XCTAssertNil(self.cartSpy.itemAddedToCart, @"Should not have added item to cart");
}

@end
