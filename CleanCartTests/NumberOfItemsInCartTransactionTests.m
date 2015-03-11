//
//  NumberOfItemsInCartTransactionTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/11/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NumberOfItemsInCartTransaction.h"
#import "CartSpy.h"
#import "ListItemsPresenterSpy.h"

@interface NumberOfItemsInCart : XCTestCase

@property (nonatomic, strong) NumberOfItemsInCartTransaction *sut;
@property (nonatomic, strong) CartSpy *cartSpy;
@property (nonatomic, strong) ListItemsPresenterSpy *presenterSpy;

@end

@implementation NumberOfItemsInCart

- (void)setUp {
    [super setUp];
    self.sut = [[NumberOfItemsInCartTransaction alloc] init];
    self.cartSpy = [[CartSpy alloc] init];
    self.sut.cart = self.cartSpy;
    self.presenterSpy = [[ListItemsPresenterSpy alloc] init];
    self.sut.delegate = self.presenterSpy;
}

- (void)tearDown {
    self.sut = nil;
    self.cartSpy = nil;
    [super tearDown];
}

- (void)testCallingExecuteSendsItemsInCartMessageToCart {
    [self.sut execute];
    XCTAssertTrue(self.cartSpy.didReceiveItemsInCartMessage, @"Should have received itemsInCart message");
}

- (void)testCallingExecuteSendsNumberToDelegate {
    Item *item = [[Item alloc] init];
    [self.cartSpy addItemToCart:item];
    [self.sut execute];
    XCTAssertTrue(self.presenterSpy.didReceiveNumberOfItemsInCart, @"Should have received number of items in cart");
    XCTAssertEqual(self.presenterSpy.numberOfItemsInCart,1, @"There should be 1 utem in the cart");
}
@end
