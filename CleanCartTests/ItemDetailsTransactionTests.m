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

@interface ItemDetailsTransactionTests : XCTestCase

@property (nonatomic, strong) ItemDetailsTransaction *sut;

@end

@implementation ItemDetailsTransactionTests

- (void)setUp {
    [super setUp];
    self.sut = [[ItemDetailsTransaction alloc] init];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

#pragma mark - Helper methods -

- (ItemRepositoryStub *)_createStubRepositoryWithItem:(Item *)item {
    ItemRepositoryStub *stubRepository = [[ItemRepositoryStub alloc] init];
    stubRepository.item = item;
    return stubRepository;
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
    Item *item = [[Item alloc] init];
    item.itemId = @"1";
    ItemRepositoryStub *stubRepository = [self _createStubRepositoryWithItem:item];
    self.sut.itemRepository = stubRepository;
    
    [self.sut execute];
    
}


@end
