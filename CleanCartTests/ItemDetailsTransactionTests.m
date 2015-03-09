//
//  ItemDetailsTransactionTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ItemRepositorySpy.h"
#import "ItemDetailsTransaction.h"
#import "ItemRepositoryStub.h"
#import "ItemDetailsPresenterSpy.h"

@interface ItemDetailsTransactionTests : XCTestCase

@property (nonatomic, strong) ItemDetailsTransaction *sut;
@property (nonatomic, strong) Item *item;
@property (nonatomic, strong) ItemDetailsPresenterSpy *presenterSpy;

@end

@implementation ItemDetailsTransactionTests

- (void)setUp {
    [super setUp];
    self.sut = [[ItemDetailsTransaction alloc] init];
    self.item = [[Item alloc] init];
    self.item.itemId = @"1";
    self.presenterSpy = [[ItemDetailsPresenterSpy alloc] init];
    self.sut.delegate = self.presenterSpy;
}

- (void)tearDown {
    self.sut = nil;
    self.item = nil;
    [super tearDown];
}

#pragma mark - Helper methods -

- (void)_setUpSutWithStubRepository {
    ItemRepositoryStub *stubRepository = [[ItemRepositoryStub alloc] init];
    stubRepository.item = self.item;
    self.sut.itemRepository = stubRepository;
}

#pragma mark - Tests -

- (void)testCallingExecuteCallsItemRepositoryWithItemId {
    ItemRepositorySpy *spyRepository = [[ItemRepositorySpy alloc] init];
    self.sut.itemId = @"1";
    self.sut.itemRepository = spyRepository;
    [self.sut execute];
    XCTAssertTrue(spyRepository.didReceiveItemForIdMessage, @"Should have received item with ID message");
    XCTAssertEqualObjects(spyRepository.receivedItemId, self.sut.itemId, @"Received item Id should match the one sent by transaction");
}

- (void)testGettingItemFromRepositorySendsItToTheDelegate {
    [self _setUpSutWithStubRepository];
    self.sut.itemId = self.item.itemId;
    [self.sut execute];
    XCTAssertTrue(self.presenterSpy.didReceiveItem, @"Should have received item from transaction");
    XCTAssertEqualObjects(self.presenterSpy.receivedItem, self.item, @"Received item should match sent item");
}

- (void)testItemNotFoundInRepositoryDoeNotCallDelegate {
    [self _setUpSutWithStubRepository];
    [self.sut execute];
    XCTAssertFalse(self.presenterSpy.didReceiveItem, @"Should not have called the delegate");
}

@end
