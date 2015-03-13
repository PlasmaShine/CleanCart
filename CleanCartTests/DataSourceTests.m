//
//  DataSourceTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/23/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "JSONDataSource.h"
#import "ItemRepositorySpy.h"
#import "ItemRepository.h"
#import "Item.h"
#import "TestHelpers.h"

@interface DataSourceTests : XCTestCase

@property (nonatomic, strong) JSONDataSource *sut;

@end

@implementation DataSourceTests

#pragma mark - Helper methods -

- (void)_assertItem:(Item *)item hasId:(NSString *)expectedId andName:(NSString *)expectedName andDescription:(NSString *)expectedDescription andPrice:(NSInteger)expectedPrice andStock:(NSInteger)expectedStock {
    XCTAssertEqualObjects(item.itemId, expectedId, @"Incorrect item Id");
    XCTAssertEqualObjects(item.itemName, expectedName, @"Incorrect name for item");
    XCTAssertEqualObjects(item.itemDescription, expectedDescription, @"Incorrect Item description");
    XCTAssertEqual(item.itemPrice, expectedPrice, @"Incorrect item price");
    XCTAssertEqual(item.itemStock, expectedStock, @"Incorrect item stock");
}

#pragma mark - Tests -

- (void)setUp {
    [super setUp];
    self.sut = [[JSONDataSource alloc] init];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

- (void)testDataIsCorrectlyFetchedFromJSONFile {
    __block BOOL dataReceived = NO;
    JSONDataSource *ds = [[JSONDataSource alloc] init];
    [ds fetchItemsWithCompletion:^(NSArray *items) {
        dataReceived = YES;
        XCTAssertEqual(items.count, 4, "4 items should have been returned");
        [self _assertItem:items[0] hasId:@"1" andName:@"Item 1" andDescription:@"This is the description for item 1" andPrice:3000 andStock:5];
        [self _assertItem:items[1] hasId:@"2" andName:@"Item 2" andDescription:@"This is the description for item 2" andPrice:4997 andStock:1];
        [self _assertItem:items[2] hasId:@"3" andName:@"Item 3" andDescription:@"This is the description for item 3" andPrice:1000 andStock:0];
        [self _assertItem:items[3] hasId:@"4" andName:@"Item 4" andDescription:@"This is the description for item 4" andPrice:9999 andStock:2];
    }];
    [TestHelpers waitFor:&dataReceived timeout:5];
    if (!dataReceived) {
        XCTFail(@"Data not received");
    }
}

@end
