//
//  ListInteractorTest.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/25/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ItemRepository.h"
#import "ListItemsTransaction.h"

@interface ListInteractorTest : XCTestCase

@end

@implementation ListInteractorTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testListInteractorConformsToProperProtocol {
//    ItemRepository *repo = [[ItemRepository alloc] init];
//    
//    ListItemsTransaction *listItems = [[ListItemsTransaction alloc] initWithRepository:repo];
//    listItems.delegate = self;
//    [listItems execute];
//}


@end
