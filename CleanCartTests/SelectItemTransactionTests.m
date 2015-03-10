//
//  SelectItemTransactionTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/10/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SelectItemTransaction.h"
#import "ItemRepositorySpy.h"

@interface SelectItemTransactionTests : XCTestCase

@property (nonatomic, strong) SelectItemTransaction *sut;
@end

@implementation SelectItemTransactionTests

- (void)setUp {
    [super setUp];
    self.sut = [[SelectItemTransaction alloc] init];
    self.sut.itemId = @"1";
}

- (void)tearDown {

    [super tearDown];
}

#pragma mark - Tests -

- (void)testCallingExecuteSelectItemInRepository {
    ItemRepositorySpy *repoSpy = [[ItemRepositorySpy alloc] init];
    self.sut.itemRepository = repoSpy;
    [self.sut execute];
    XCTAssertTrue(repoSpy.didReceiveSelectItemMessage, @"Should have received the select item message");
    XCTAssertEqualObjects(repoSpy.receivedItemId, @"1", @"Should have received the correct item ID");
}

@end
