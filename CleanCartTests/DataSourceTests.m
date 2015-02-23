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
#import "DataSourceIO.h"
#import "ItemRepositorySpy.h"
#import "ItemRepository.h"
#import "Item.h"

@interface DataSourceTests : XCTestCase <DataSourceResponse>

@property (nonatomic, assign) BOOL dataReceived;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) JSONDataSource *sut;

@end

@implementation DataSourceTests

#pragma mark - Helper methods

- (void)waitFor:(BOOL *)flag timeout:(NSTimeInterval)timeoutSecs {
    NSTimeInterval runningTime = 0;
    NSTimeInterval timeIncrement = 0.01;
    NSDate *timeoutDate = [NSDate dateWithTimeIntervalSinceNow:timeIncrement];
    while (!*flag && !runningTime>=timeoutSecs && [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:timeoutDate]) {
        timeoutDate = [NSDate dateWithTimeIntervalSinceNow:timeIncrement];
        ;
        runningTime +=timeIncrement;
    }
}

#pragma mark - DataSourceResponse

- (void)didReceiveItems:(NSArray *)items {
    self.items  = items;
    self.dataReceived = YES;
}

#pragma mark - Tests

- (void)setUp {
    [super setUp];
    self.items = nil;
    self.dataReceived = NO;
    self.sut = [[JSONDataSource alloc] init];
}

- (void)tearDown {
    self.sut = nil;
    self.items = nil;
    [super tearDown];
}

- (void)testDataSourceConformsToDataSourceRequestProtocol {
    XCTAssertTrue([JSONDataSource.class conformsToProtocol:@protocol(DataSourceRequest)], @"Data source should conform to DataSourceRequestProtocol");
}

- (void)testNonConformingDelegateCannotBeSetForDataSource {
    XCTAssertThrows(self.sut.delegate =
                    (id <DataSourceResponse>)[NSNull null], "Should not be able to set object not conforming to DataSourceResponse protocol as a delegate");
}

- (void)testNilCanBeSetAsDelegateForDataSource {
    XCTAssertNoThrow(self.sut.delegate = nil, "Should be able to set nil as a delegate");
}

- (void)testWhenItemsAreReceivedMessageIsSentToDelegate {
    ItemRepositorySpy *repo = [[ItemRepositorySpy alloc] init];
    self.sut.delegate = repo;
    [self.sut fetchItems];
    XCTAssertTrue(repo.didReceiveItemRetrievalMessage, "Delegate should have received the didRetrieveItems message");
}

- (void)testDataIsCorrectlyFetchedFromJSONFile {
    JSONDataSource *ds = [[JSONDataSource alloc] init];
    ds.delegate = self;
    [ds fetchItems];
    [self waitFor:&_dataReceived timeout:1];
    Item *item = self.items[0];
    XCTAssertEqual(self.items.count, 4, "4 items should have been returned");
    XCTAssertEqualObjects(item.itemId, @"1", @"Incorrect description for item");
    XCTAssertEqualObjects(item.itemName, @"Item 1", @"Incorrect description for item");
    XCTAssertEqualObjects(item.itemDescription, @"This is the description for item 1");
    XCTAssertEqual(item.itemPrice, 3000, @"Item price should be 3000");
    XCTAssertEqual(item.itemStock, 5, @"Item stock should be 5");
}

@end
