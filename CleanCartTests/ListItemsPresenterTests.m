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
#import "Section.h"

@interface ListItemsPresenterTests : XCTestCase

@property (nonatomic, strong) ListItemsPresenter *sut;
@property (nonatomic, strong) ListItemsViewControllerSpy *viewControllerSpy ;
@property (nonatomic, strong) DisplayListItem *item1;
@property (nonatomic, strong) DisplayListItem *item2;
@property (nonatomic, strong) DisplayListItem *item3;
@property (nonatomic, strong) DisplayListItem *item4;
@property (nonatomic, strong) DisplayListItem *item5;

@end

@implementation ListItemsPresenterTests

- (void)setUp {
    self.sut = [[ListItemsPresenter alloc] init];
    self.viewControllerSpy = [[ListItemsViewControllerSpy alloc] init];
    self.sut.delegate = self.viewControllerSpy;
    self.item1 = [[DisplayListItem alloc] init];
    self.item2 = [[DisplayListItem alloc] init];
    self.item3 = [[DisplayListItem alloc] init];

    [super setUp];
}

- (void)tearDown {
    self.sut.delegate = nil;
    self.sut = nil;
    [super tearDown];
}
#pragma mark - Helpers

- (void)_assert:(NSInteger)numberOfSections sectionsForItems:(NSArray *)items {
    XCTAssertEqual(self.viewControllerSpy.receivedItems.count, numberOfSections, @"Incorect number of sections");
}

- (void)_assert:(NSInteger)numberOfItems itemsForSection:(NSInteger)sectionNumber {
    Section *section = self.viewControllerSpy.receivedItems[sectionNumber];
    XCTAssertEqual(section.items.count, numberOfItems, @"Incorrect number of items in section");
}

#pragma mark - Tests

- (void)testPresenterConformsToProperProtocols {
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(ListItemsTransactionResponse)], @"");
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(ListItemsPresenterRequest)]);
}

- (void)testFetchItemsSignalCallsListItemsTransaction {
    ListItemsTransactionSpy *listItemsTransactionSpy = [[ListItemsTransactionSpy alloc] init];
    self.sut.listItemsTransaction = listItemsTransactionSpy;
    [self.sut fetchData];
    XCTAssertTrue(listItemsTransactionSpy.didReceiveExecuteMessage, @"Presenter should have called execute on ListItemsTransaction");
}

- (void)testReceivingItemsFromTransactionCallsUIRefresh {
    ListItemsViewControllerSpy *viewControllerSpy = [[ListItemsViewControllerSpy alloc] init];
    self.sut.delegate = viewControllerSpy;
    [self.sut didReceiveItems:[NSArray array]];
    XCTAssertTrue(viewControllerSpy.didReceiveRefreshUIMessage, @"Receiving new objects from the iteractor should have called refreshUI");
}

- (void)testPresenterSendsReceivedDataAsArrayOfSections {
    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, nil];
    [self.sut didReceiveItems:itemArray];
    XCTAssertTrue([self.viewControllerSpy.receivedItems[0] isKindOfClass:[Section class]], @"Presenter should have sent items to UI as a section array");
}

- (void)testOneItemHasOnlyOneSection {
    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, nil];
    [self.sut didReceiveItems:itemArray];
    [self _assert:1 sectionsForItems:itemArray];
    [self _assert:1 itemsForSection:0];
}

- (void)testTwoItemsHaveOnlyOneSection {
    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, self.item2, nil];
    [self.sut didReceiveItems:itemArray];
    [self _assert:1 sectionsForItems:itemArray];
    [self _assert:2 itemsForSection:0];
}

- (void)testThreeItemsHaveTwoSections {
    NSArray *itemArray = [[NSArray alloc] initWithObjects:self.item1, self.item2, self.item3, nil];
    [self.sut didReceiveItems:itemArray];
    [self _assert:2 sectionsForItems:itemArray];
    [self _assert:2 itemsForSection:0];
    [self _assert:1 itemsForSection:1];
}


@end
