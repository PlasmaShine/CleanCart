//
//  ListItemsTransactionTest.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/25/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ItemRepositorySpy.h"
#import "ListItemsTransaction.h"
#import "ListItemsTransactionIO.h"
#import "Item.h"

@interface ListItemsTransactionTest : XCTestCase

@end

@implementation ListItemsTransactionTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - Tests

- (void)testCallingExecuteOnTransactionSendsMessageToRepository {
    ItemRepositorySpy *repoSpy = [[ItemRepositorySpy alloc] init];
    ListItemsTransaction *sut = [[ListItemsTransaction alloc] initWithRepository:repoSpy];
    [sut execute];
    XCTAssertTrue(repoSpy.didReceiveAllItemsMessage, @"Execute should call repository to get items");
}

//- (void)testListItemTransactionReturnsReceivedItemsAsListDisplayItems {
//    Item *item1 = [[Item alloc] init];
//    item1.itemId = @"1";
//    Item *item2 = [[Item alloc] init];
//    item2.itemId = @"2";
//    NSArray *items = [[NSArray alloc] initWithObjects:item1, item2, nil];
//    ListItemsTransaction *sut = [[ListItemsTransaction alloc] initWithRepository:nil];
//    
//}


@end
