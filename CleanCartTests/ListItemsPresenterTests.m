//
//  ListItemsPresenterTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/27/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ListItemsPresenter.h"
#import "ListItemsTransactionIO.h"
#import "ListItemsPresenterIO.h"
#import "ListItemsTransactionSpy.h"
#import "ListItemsViewControllerSpy.h"
#import "DisplayListItem.h"

@interface ListItemsPresenterTests : XCTestCase

@property (nonatomic, strong) ListItemsPresenter *sut;

@end

@implementation ListItemsPresenterTests

- (void)setUp {
    self.sut = [[ListItemsPresenter alloc] init];
    [super setUp];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

#pragma mark - Tests

- (void)testPresenterConformsToProperProtocols {
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(ListItemsTransactionResponse)], @"");
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(ListItemsPresenterRequest)]);
}

- (void)testFetchItemsSignalCallsListItemsTransaction {
    ListItemsTransactionSpy *listItemsTransactionSpy = [[ListItemsTransactionSpy alloc] init];
    self.sut.listItemsTransaction = listItemsTransactionSpy;
    [self.sut fetchItems];
    XCTAssertTrue(listItemsTransactionSpy.didReceiveExecuteMessage, @"Presenter should have called execute on ListItemsTransaction");
}

- (void)testReceivingItemsFromTransactionCallsUIRefresh {
    ListItemsViewControllerSpy *viewControllerSpy = [[ListItemsViewControllerSpy alloc] init];
    self.sut.delegate = viewControllerSpy;
    [self.sut didReceiveItems:[NSArray array]];
    XCTAssertTrue(viewControllerSpy.didReceiveRefreshUIMessage, @"Receiving new objects from the iteractor should have called refreshUI");
}

- (void)testPresenterSendsReceivedDataAsArrayOfSections {
    DisplayListItem *displayItem = [[DisplayListItem alloc] init];
    
}

@end
