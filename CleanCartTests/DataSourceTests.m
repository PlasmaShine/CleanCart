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

@interface DataSourceTests : XCTestCase <DataSourceResponse>

@property (nonatomic, assign) BOOL dataReceived;
@property (nonatomic, strong) NSArray *items;
@end

@implementation DataSourceTests

#pragma mark - Helper methods

- (BOOL)waitFor:(BOOL *)flag timeout:(NSTimeInterval)timeoutSecs {
    NSDate *timeoutDate = [NSDate dateWithTimeIntervalSinceNow:timeoutSecs];
    do {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:timeoutDate];
        if ([timeoutDate timeIntervalSinceNow] < 0.0) {
            break;
        }
    }
    while (!*flag);
    return *flag;
}

#pragma mark - DataSourceResponse

- (void)didReceiveItems:(NSArray *)items {
    self.items  = items;
    self.dataReceived = YES;
}

#pragma mark - Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDataSourceConformsToDataSourceRequestProtocol {
    XCTAssertTrue([JSONDataSource.class conformsToProtocol:@protocol(DataSourceRequest)], @"Data source should conform to DataSourceRequestProtocol");
}

- (void)testNonConformingDelegateCannotBeSetForDataSource {
    JSONDataSource *ds = [[JSONDataSource alloc] init];
    XCTAssertThrows(ds.delegate =
                    (id <DataSourceResponse>)[NSNull null], "Should not be able to set object not conforming to DataSourceResponse protocol as a delegate");
}

- (void)testWhenItemsAreReceivedMessageIsSentToDelegate {
    JSONDataSource *ds = [[JSONDataSource alloc] init];
    ItemRepositorySpy *repo = [[ItemRepositorySpy alloc] init];
    ds.delegate = repo;
    [ds fetchItems];
    XCTAssertTrue(repo.didReceiveItemRetrievalMessage, "Delegate should have received the didRetrieveItems message");
}

- (void)testDataIsCorrectlyFetchedFromJSONFile {
    JSONDataSource *ds = [[JSONDataSource alloc] init];
    [ds fetchItems];
    [self waitFor:&_dataReceived timeout:1];
    XCTAssertEqual(self.items.count, 4, "There should be 4 items returned");
}

@end
