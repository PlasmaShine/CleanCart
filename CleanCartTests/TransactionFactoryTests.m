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
    XCTAssertThrows([self.sut createTransaction:ListItemsTransactionId forCaller:nil andParameter:nil], @"SHould have thrown exception for nonconforming caller");
}

- (void)testListItemsTransactionIsProperlyConfigured {
    ListItemsPresenterSpy *caller = [[ListItemsPresenterSpy alloc] init];
    ListItemsTransaction *transaction = (ListItemsTransaction *)[self.sut createTransaction:ListItemsTransactionId forCaller:caller andParameter:nil];
    XCTAssertNotNil(transaction.itemRepository,@"Repository should not be nil");
    XCTAssertEqualObjects(transaction.delegate, caller, @"Transaction delegate should be set to the caller");
    XCTAssertEqualObjects(transaction.itemRepository.delegate, transaction, @"Transaction should be the delegate for the item repository");
    XCTAssertNotNil(transaction.itemRepository.dataSource, @"Data source should not be nil");
    XCTAssertEqualObjects(transaction.itemRepository.dataSource.delegate, transaction.itemRepository, @"The repository should be the delegate for the data source");
}

@end
