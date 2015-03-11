//
//  ListItemsViewControllerTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/2/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ListitemsViewController.h"
#import <UIKit/UIKit.h>
#import "ListItemsPresenterIO.h"
#import "ListItemsPresenterSpy.h"
#import <objc/runtime.h>
#import "Section.h"
#import "PresentableListItem.h"
#import "ListItemsCollectionCell.h"
#import "ListItemsCollectionCellDelegate.h"

@interface ListItemsViewControllerTests : XCTestCase

@property (nonatomic, strong) ListItemsViewController *sut;
@property (nonatomic, strong) ListItemsPresenterSpy *presenterSpy;
@property (nonatomic, strong) NSArray* testData;
@property (nonatomic, strong) PresentableListItem* item2;

@end

@implementation ListItemsViewControllerTests

- (void)setUp {
    [super setUp];
    self.sut = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ListItemsViewController"];
    self.presenterSpy = [[ListItemsPresenterSpy alloc] init];
    self.sut.eventHandler = self.presenterSpy;
    [self _createTestData];
}

- (void)_createTestData {
    Section *section1 = [[Section alloc] init];
    Section *section2 = [[Section alloc] init];
    PresentableListItem *item1 = [[PresentableListItem alloc] init];
    self.item2 = [[PresentableListItem alloc] init];
    self.item2.itemId = @"1";
    self.item2.itemName = @"Item 2";
    self.item2.itemPrice = @"4000";
    self.item2.itemStock = @"34";
    PresentableListItem *item3 = [[PresentableListItem alloc] init];
    section1.items = [[NSArray alloc] initWithObjects:item1, self.item2, nil];
    section2.items = [[NSArray alloc] initWithObjects:item3, nil];
    self.testData = [[NSArray alloc] initWithObjects:section1, section2, nil];
}

- (void)tearDown {
    self.sut = nil;
    self.presenterSpy = nil;
    self.testData = nil;
    self.item2 = nil;
    [super tearDown];
}

#pragma mark - Helper Methods -

- (UICollectionViewCell *)_cellInSection0Row1 {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    return [self.sut collectionView:self.sut.collectionView cellForItemAtIndexPath:indexPath];
}

#pragma mark - Tests -

- (void)testIfViewControllerIsTheCorrectType {
    XCTAssertTrue([self.sut isKindOfClass:[ListItemsViewController class]],@"Incorrect type of viewController");
}

- (void)testViewControllerConformsToProperProtocols {
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(ListItemsPresenterResponse)], @"ViewController should conform to the proper protocol");
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(UICollectionViewDataSource)], @"ViewController should conform to the proper protocol");
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(UICollectionViewDelegate)], @"ViewController should conform to the proper protocol");
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(ListItemsCollectionCellDelegate)], @"ViewController should conform to the proper protocol");
}

- (void)testViewControllerHasADataSourceSetToItsself {
    UICollectionView *collectionView = self.sut.collectionView;
    XCTAssertTrue(collectionView.dataSource == self.sut, @"There should be a dataSourceView property set on the viewController");
}

- (void)testViewControllerHasACollectionDelegateSetToItsself {
    UICollectionView *collectionView = self.sut.collectionView;
    XCTAssertTrue(collectionView.delegate == self.sut, @"There should be a dataSourceView property set on the viewController");
}

- (void)testLoadingTheViewSendsFetchDataMessageToPresenter {
    [self.sut viewDidLoad];
    XCTAssertTrue(self.presenterSpy.didReceiveLoadViewMessage, @"Presenter should have receved the fetchData message");
}

- (void)testTappingCartButtonSendsCartTappedMessageToPresenter {
    [self.sut.cartButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    XCTAssertTrue(self.presenterSpy.didReceiveCartTappedMessage,@"Presenter should have received the cart tap message");
}

- (void)testNothingBadHappensWhenDataPassedToTheViewControllerIsNil {
    [self.sut refreshUIWithData:nil];
    XCTAssertEqual([self.sut numberOfSectionsInCollectionView:self.sut.collectionView], 0, @"There should be 0 sections in the collectionView");
}

- (void)testViewControllerReturnsCorrectNumberOfSections {
    [self.sut refreshUIWithData:self.testData];
    XCTAssertEqual([self.sut numberOfSectionsInCollectionView:self.sut.collectionView], 2, @"There should be 2 sections in the collectionView");
}

- (void)testViewControllerReturnsCorrectNumberOfItemsPerSection {
    [self.sut refreshUIWithData:self.testData];
    XCTAssertEqual([self.sut collectionView:self.sut.collectionView numberOfItemsInSection:0], 2, @"There should be 2 items in the first section");
    XCTAssertEqual([self.sut collectionView:self.sut.collectionView numberOfItemsInSection:1], 1, @"There should be 1 items in the second section");
}

- (void)testCellForRowAtIndexPathIsOfTheProperType {
    [self.sut refreshUIWithData:self.testData];
    NSBundle *mainBundle = [NSBundle mainBundle];
    XCTAssertNotNil(mainBundle);
    UICollectionViewCell *cell = [self _cellInSection0Row1];
    XCTAssertTrue([cell isKindOfClass:[ListItemsCollectionCell class]], @"The cell should be a ListItemsCollectionCell");
}

- (void)testReturnedCellIsProperlyConfigured {
    [self.sut refreshUIWithData:self.testData];
    ListItemsCollectionCell *cell = (ListItemsCollectionCell *)[self _cellInSection0Row1];
    XCTAssertEqualObjects(cell.item, self.item2, @"The cell should be configured for item2");
    XCTAssertEqualObjects(cell.delegate, self.sut,@"View controller should be the delegate for the cell");
}

- (void)testReceivingNumberOfItemsInTheCartUpdateCartButtonTitle {
    [self.sut numberOfItemsCurrentlyInCart:@"1"];
    XCTAssertEqualObjects(@"1", self.sut.cartButton.titleLabel.text, @"The cart button lable should have been updated");
}

#pragma mark - Event handling -

- (void)testTappingOnACellSendsTheCellTappedMessageToPresenterWithItemId {
    [self.sut refreshUIWithData:self.testData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    [self.sut collectionView:self.sut.collectionView didSelectItemAtIndexPath:indexPath];
    XCTAssertTrue(self.presenterSpy.didReceiveCellSelectedMessage, @"Should have received cell selectin message");
    XCTAssertEqualObjects(self.presenterSpy.selectedItemId, self.item2.itemId);
}

- (void)testReceivingAddToCartMessageSendsAddToCartMethodToPresenter {
    [self.sut didTapAddToCartForItemWithId:@"1"];
    XCTAssertTrue(self.presenterSpy.didReceiveAddToCartMessage, @"Should have received add to cart message");
    XCTAssertEqualObjects(self.presenterSpy.addToCartId, @"1", @"The correct item ID should have been sent to presenter");
}

- (void)testViewWillAppearSendsMessageToEventHandler {
    [self.sut viewWillAppear:YES];
    XCTAssertTrue(self.presenterSpy.didReceiveViewWillAppearMessage, @"Event handler should have received viewWillAppear message");
}

- (void)testViewWillDisappearSendsMessageToEventHandler {
    [self.sut viewWillDisappear:YES];
    XCTAssertTrue(self.presenterSpy.didReceiveViewWillDisappearMessage, @"Event handler should have received viewWillAppear message");
}

@end
