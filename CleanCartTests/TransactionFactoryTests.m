//
//  TransactionFactoryTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TransactionFactory.h"
#import "ListItemsPresenterSpy.h"
#import "ListItemsTransaction.h"
#import "ItemDetailsTransaction.h"
#import "ItemDetailsPresenterSpy.h"
#import "SelectItemTransaction.h"
#import "NumberOfItemsInCartTransaction.h"
#import "AddToCartTransaction.h"
#import "CartPresenterSpy.h"
#import "ListCartItemsTransaction.h"

@interface TransactionFactoryTests : XCTestCase

@property (nonatomic, strong) TransactionFactory *sut;

@end

@implementation TransactionFactoryTests

- (void)setUp {
    [super setUp];
    self.sut = [[TransactionFactory alloc] init];
}

#pragma mark - Tests -

#pragma mark - ListItemsTransaction -

- (void)testCreatingListItemsTransactionWithoutConformingCallerThrowsException {
    XCTAssertThrows([self.sut createTransaction:ListItemsTransactionId forCaller:nil andParameter:nil], @"Should have thrown exception for nonconforming caller");
}

- (void)testListItemsTransactionIsProperlyConfigured {
    ListItemsPresenterSpy *caller = [[ListItemsPresenterSpy alloc] init];
    ListItemsTransaction *transaction = (ListItemsTransaction *)[self.sut createTransaction:ListItemsTransactionId forCaller:caller andParameter:nil];
    XCTAssertNotNil(transaction.itemRepository,@"Repository should not be nil");
    XCTAssertEqualObjects(transaction.delegate, caller, @"Transaction delegate should be set to the caller");
    XCTAssertNotNil(transaction.itemRepository.dataSource, @"Data source should not be nil");
}

#pragma mark - SelectItemTransaction -

- (void)testSelectItemTransactionThrowsExceptionWhenPaparameterIsNotString {
    ListItemsPresenterSpy *caller = [[ListItemsPresenterSpy alloc] init];
    XCTAssertThrows([self.sut createTransaction:SelectItemTransactionId forCaller:caller andParameter:[[NSObject alloc] init]], @"Should have thrown exception for non-string parameter");
}

- (void)testSelectItemTransactionDoesNotThrowExceptionWhenPaparameterIsNil {
    ListItemsPresenterSpy *caller = [[ListItemsPresenterSpy alloc] init];
    XCTAssertNoThrow([self.sut createTransaction:SelectItemTransactionId forCaller:caller andParameter:nil], @"Should not have thrown exception for non-string parameter");
}

- (void)testSelectItemTransactionIsProperlyConfigured {
    ListItemsPresenterSpy *caller = [[ListItemsPresenterSpy alloc] init];
    SelectItemTransaction *transaction = (SelectItemTransaction *)[self.sut createTransaction:SelectItemTransactionId forCaller:caller andParameter:@"1"];
    XCTAssertNotNil(transaction.itemRepository,@"Repository should not be nil");
    XCTAssertNotNil(transaction.itemRepository.dataSource, @"Data source should not be nil");
    XCTAssertEqualObjects(transaction.itemId, @"1", @"Item ID should be set");
}

#pragma mark - ItemDetailsTransaction -

- (void)testCreatingItemDetailsTransactionWithoutConformingCallerThrowsException {
    XCTAssertThrows([self.sut createTransaction:ItemDetailsTransactionId forCaller:nil andParameter:nil], @"Should have thrown exception for nonconforming caller");
}

- (void)testItemDetailsTransactionIsProperlyConfigured {
    ItemDetailsPresenterSpy *caller = [[ItemDetailsPresenterSpy alloc] init];
    ItemDetailsTransaction *transaction = (ItemDetailsTransaction *)[self.sut createTransaction:ItemDetailsTransactionId forCaller:caller andParameter:nil];
    XCTAssertNotNil(transaction.itemRepository,@"Repository should not be nil");
    XCTAssertEqualObjects(transaction.delegate, caller, @"Transaction delegate should be set to the caller");
    XCTAssertNotNil(transaction.itemRepository.dataSource, @"Data source should not be nil");
}

#pragma mark - NumberOfItemsInCartTransaction -

- (void)testCreatingNumberOfItemsInCartTransactionWithoutConformingCallerThrowsException {
    XCTAssertThrows([self.sut createTransaction:NumberOfItemsInCartTransactionId forCaller:nil andParameter:nil], @"Should have thrown exception for nonconforming caller");
}

- (void)testNumberOfItemsInCartTransactionIsProperlyConfigured {
    ListItemsPresenterSpy *caller = [[ListItemsPresenterSpy alloc] init];
    NumberOfItemsInCartTransaction *transaction = (NumberOfItemsInCartTransaction *)[self.sut createTransaction:NumberOfItemsInCartTransactionId forCaller:caller andParameter:nil];
    XCTAssertNotNil(transaction.cart,@"Cart should not be nil");
    XCTAssertEqualObjects(transaction.delegate, caller, @"Transaction delegate should be set to the caller");
}

#pragma mark - AddToCartTransaction -

- (void)testAddToCartTransactionIsProperlyConfigured {
    ListItemsPresenterSpy *caller = [[ListItemsPresenterSpy alloc] init];
    AddToCartTransaction *transaction = (AddToCartTransaction *)[self.sut createTransaction:AddToCartTransactionId forCaller:caller andParameter:@"1"];
    XCTAssertNotNil(transaction.itemRepository,@"Repository should not be nil");
    XCTAssertNotNil(transaction.itemRepository.dataSource, @"Data source should not be nil");
    XCTAssertNotNil(transaction.cart,@"Cart should not be nil");
    XCTAssertEqualObjects(transaction.itemId, @"1", @"Item ID should be set");
}

#pragma mark - ListItemsInCartTransaction -

- (void)testCreatingListCartItemsTransactionWithoutConformingCallerThrowsException {
    XCTAssertThrows([self.sut createTransaction:ListCartItemsTransactionId forCaller:nil andParameter:nil], @"Should have thrown exception for nonconforming caller");
}

- (void)testListCartItemsTransactionIsProperlyConfigured {
    CartPresenterSpy *caller = [[CartPresenterSpy alloc] init];
    ListCartItemsTransaction *transaction = (ListCartItemsTransaction *)[self.sut createTransaction: ListCartItemsTransactionId forCaller:caller andParameter:nil];
    XCTAssertNotNil(transaction.cart,@"Cart should not be nil");
    XCTAssertEqualObjects(transaction.delegate, caller, @"Transaction delegate should be set to the caller");
}

@end
