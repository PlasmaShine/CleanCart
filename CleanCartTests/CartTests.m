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
#import "CartItem.h"
#import "ErrorManagerSpy.h"
#import "ErrorCodes.h"
#import "ErrorDomains.h"

@interface CartTests : XCTestCase

@property (nonatomic, strong) Cart *sut;
@property (nonatomic, strong) Item *item1;
@property (nonatomic, strong) Item *item2;
@property (nonatomic, strong) ErrorManagerSpy *errorManagerSpy;


@end

@implementation CartTests

- (void)setUp {
    [super setUp];
    self.sut = [[Cart alloc] init];
    self.item1 = [[Item alloc] init];
    self.item1.itemId = @"1";
    self.item1.itemStock = 2;
    self.item2 = [[Item alloc] init];
    self.item2.itemId = @"2";
    self.item2.itemStock = 1;
    self.errorManagerSpy = [[ErrorManagerSpy alloc] init];
    self.sut.errorManager = self.errorManagerSpy;
}

- (void)tearDown {
    self.sut = nil;
    self.item1 = nil;
    self.item2 = nil;
    self.errorManagerSpy = nil;
    [super tearDown];
}

#pragma mark - Helper methods -

- (void)_assertCartContainsItem:(Item *)item inQuantity:(NSInteger) quantity {
    NSArray *cartItems = [self.sut itemsInCart];
    for (NSInteger i=0; i<cartItems.count; i++) {
        CartItem *cartItem = cartItems[i];
        if ([cartItem.item isEqual:item]) {
            XCTAssertEqual(cartItem.quantity, quantity, @"The quantity for the iten should be %ld!", quantity);
            return;
        }
    }
    XCTFail(@"Item should have been in the cart");
}

- (void)_assertCartIsEmpty {
    NSArray *cartItems = [self.sut itemsInCart];
    XCTAssertEqual(cartItems.count, 0, @"Thecart should be empty");
}

- (void)_assertErrorManagerReceivedErrorWithDomain:(NSString *)domain andCode:(ErrorCodes)code {
    XCTAssertTrue(self.errorManagerSpy.didReceiveError, @"Error manager should have received an error");
    XCTAssertEqualObjects(self.errorManagerSpy.receivedErrorDomain, domain, @"Error should have proper domain");
    XCTAssertEqual(self.errorManagerSpy.receivedErrorCode, code, @"Error should have proper code");
}

#pragma mark - Tests -

- (void)testAddingOneItemToCart {
    [self.sut addItemToCart:self.item1 inQuantity:1];
    [self _assertCartContainsItem:self.item1 inQuantity:1];
}

- (void)testAddingTwoItemsToCart {
    [self.sut addItemToCart:self.item1 inQuantity:1];
    [self.sut addItemToCart:self.item2 inQuantity:1];
    [self _assertCartContainsItem:self.item1 inQuantity:1];
    [self _assertCartContainsItem:self.item2 inQuantity:1];
}

- (void)testCanRemoveItemsFromCart {
    [self.sut addItemToCart:self.item1 inQuantity:1];
    [self.sut removeItemFromCart:self.item1];
    [self _assertCartIsEmpty];
}

- (void)testRemovingNonExistentItemHasNoEffect {
    [self.sut addItemToCart:self.item1 inQuantity:1];
    [self.sut removeItemFromCart:self.item2];
    [self _assertCartContainsItem:self.item1 inQuantity:1];
}

- (void)testAddingTheSameItemInDifferentQuantitiesIncreasesCartQuantity {
    self.item1.itemStock = 3;
    [self.sut addItemToCart:self.item1 inQuantity:1];
    [self.sut addItemToCart:self.item1 inQuantity:2];
    [self _assertCartContainsItem:self.item1 inQuantity:3];
}

- (void)testAddingMoreItemsThanStockSendsError {
    [self.sut addItemToCart:self.item1 inQuantity:5];
    [self _assertCartIsEmpty];
    [self _assertErrorManagerReceivedErrorWithDomain:CartErrorDomain andCode:QuantityExceedsStockErrorCode];
}

- (void)testAddingItemsOneByOneAndExceedingStockSendsError {
    [self.sut addItemToCart:self.item1 inQuantity:2];
    [self.sut addItemToCart:self.item1 inQuantity:1];
    [self _assertCartContainsItem:self.item1 inQuantity:2];
    [self _assertErrorManagerReceivedErrorWithDomain:CartErrorDomain andCode:QuantityExceedsStockErrorCode];
}

@end
