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
#import "ListItemsPresenterSpy.h"
#import "DisplayListItem.h"

@interface ListItemsTransactionTest : XCTestCase

@property (nonatomic, strong) ListItemsTransaction *sut;
@property (nonatomic, strong) ItemRepositorySpy *repoSpy;
@property (nonatomic, strong) ListItemsPresenterSpy *presenterSpy;
@property (nonatomic, strong) NSArray *items;
@end

@implementation ListItemsTransactionTest

- (void)setUp {
    [super setUp];
    self.repoSpy = [[ItemRepositorySpy alloc] init];
    self.sut = [[ListItemsTransaction alloc] init];
    self.sut.repository = self.repoSpy;
    self.items = [self _createItemArray];
    self.presenterSpy = [[ListItemsPresenterSpy alloc] init];
    self.sut.delegate = self.presenterSpy;
    [self.sut didReceiveItems:self.items];
}

- (void)tearDown {
    self.repoSpy = nil;
    self.sut = nil;
    self.items = nil;
    self.presenterSpy = nil;
    [super tearDown];
}

#pragma mark - Helper methods -

- (NSArray *)_createItemArray {
    Item *item = [[Item alloc] init];
    item.itemId = @"Item 1 id";
    item.itemDescription = @"Item 1 description";
    item.itemName = @"Item 1 name";
    item.itemPrice = 500;
    item.itemStock = 3;
    return [[NSArray alloc] initWithObjects:item, nil];
}

#pragma mark - Tests -

- (void)testCallingExecuteOnTransactionSendsMessageToRepository {
    [self.sut execute];
    XCTAssertTrue(self.repoSpy.didReceiveAllItemsMessage, @"Execute should call repository to get items");
}

- (void)testListItemTransactionReturnsReceivedItemsToPresenter {
    XCTAssertTrue(self.presenterSpy.didReceiveItemsFromTransaction, @"Should have received items from transaction");
}

- (void)testItemsAreSentToPresenter {
    XCTAssertEqual(self.presenterSpy.receivedItems.count, self.items.count, @"Number of items in the presenter should be the same as the number of items in the interactor");
}


@end
