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

#pragma mark - Helper methods -

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

- (void)_assertItem:(Item *)item hasId:(NSString *)expectedId andName:(NSString *)expectedName andDescription:(NSString *)expectedDescription andPrice:(NSInteger)expectedPrice andStock:(NSInteger)expectedStock {
    XCTAssertEqualObjects(item.itemId, expectedId, @"Incorrect item Id");
    XCTAssertEqualObjects(item.itemName, expectedName, @"Incorrect name for item");
    XCTAssertEqualObjects(item.itemDescription, expectedDescription, @"Incorrect Item description");
    XCTAssertEqual(item.itemPrice, expectedPrice, @"Incorrect item price");
    XCTAssertEqual(item.itemStock, expectedStock, @"Incorrect item stock");
}

#pragma mark - DataSourceResponse -

- (void)didReceiveItems:(NSArray *)items {
    self.items  = items;
    self.dataReceived = YES;
}

#pragma mark - Tests -

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

- (void)testWhenItemsAreReceivedMessageIsSentToDelegate {
    ItemRepositorySpy *repo = [[ItemRepositorySpy alloc] init];
    self.sut.delegate = repo;
    [self.sut fetchItems];
    XCTAssertTrue(repo.didReceiveItemRetrievalMessage, "Delegate should have received the didRetrieveItems message");
}

- (void)testDataIsCorrectlyFetchedFromJSONFile {
    //Since the data source is a mock that reads data from the disk,
    //the test below can be done in a simpler fashion. However, I
    //wanted to illustrate how to do testing of asynchronous calls
    //using the self-shunt pattern.
    JSONDataSource *ds = [[JSONDataSource alloc] init];
    ds.delegate = self;
    [ds fetchItems];
    [self waitFor:&_dataReceived timeout:1];
    
    XCTAssertEqual(self.items.count, 4, "4 items should have been returned");
    [self _assertItem:self.items[0] hasId:@"1" andName:@"Item 1" andDescription:@"This is the description for item 1" andPrice:3000 andStock:5];
    [self _assertItem:self.items[1] hasId:@"2" andName:@"Item 2" andDescription:@"This is the description for item 2" andPrice:4997 andStock:1];
    [self _assertItem:self.items[2] hasId:@"3" andName:@"Item 3" andDescription:@"This is the description for item 3" andPrice:1000 andStock:0];
    [self _assertItem:self.items[3] hasId:@"4" andName:@"Item 4" andDescription:@"This is the description for item 4" andPrice:9999 andStock:2];
}

@end
