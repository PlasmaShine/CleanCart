//
//  ItemRepositoryTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/23/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Item.h"
#import "ItemRepository.h"

@interface ItemRepositoryTests : XCTestCase

@end

@implementation ItemRepositoryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testItemRepositoryReturnsCorrectItems {
    NSArray *items = [[NSArray alloc] initWithObjects:[[Item alloc]init], [[Item alloc] init], nil];
    ItemRepository *repo = [[ItemRepository alloc]init];
    [repo didReceiveItems:items];
    XCTAssertEqualObjects([repo allItems], items, @"Items in the repository should be identical to those received from the data source");
}

- (void)testItemRepositoryNotifiesDelegateWhenItemsAreReceived {
    ItemRepository *repo = [[ItemRepository alloc] init];
    Item *item1 = [[Item alloc] init];
    item1.itemId = @"1";
    Item *item2 = [[Item alloc] init];
    item2.itemId = @"2";
    NSArray *items = [[NSArray alloc] initWithObjects:item1, item2, nil];
    
}

@end
