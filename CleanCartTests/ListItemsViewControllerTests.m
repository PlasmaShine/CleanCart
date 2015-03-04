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

@interface ListItemsViewControllerTests : XCTestCase

@property (nonatomic, strong) ListItemsViewController *sut;

@end

@implementation ListItemsViewControllerTests

- (void)setUp {
    [super setUp];
    self.sut = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ListItemsViewController"];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

#pragma mark - Tests

- (void)testIfViewControllerIsTheCorrectType {
    XCTAssertTrue([self.sut isKindOfClass:[ListItemsViewController class]],@"Incorrect type of viewController");
}
- (void)testViewControllerConformsToProperProtocols {
    XCTAssertTrue([self.sut conformsToProtocol:@protocol(ListItemsPresenterResponse)], @"ViewController should conform to the proper protocol");
}


- (void)testViewControlllerHasACollectionViewProperty {
    XCTAssertTrue(self.sut.collectionView != nil, @"There should be a collectionView property set on the viewController");
}

- (void)testViewControllerHasADataSourceSetToItsself {
    UICollectionView *collectionView = self.sut.collectionView;
    XCTAssertTrue(collectionView.dataSource == self.sut, @"There should be a dataSourceView property set on the viewController");
}

- (void)testViewControllerHasADelegateSetToItsself {
    UICollectionView *collectionView = self.sut.collectionView;
    XCTAssertTrue(collectionView.delegate == self.sut, @"There should be a dataSourceView property set on the viewController");
}

- (void)testLoadingTheViewSendsFetchDataMessageToPresenter {
    ListItemsPresenterSpy *presenterSpy = [[ListItemsPresenterSpy alloc] init];
    self.sut.eventHandler = presenterSpy;
    [self.sut viewDidLoad];
    XCTAssertTrue(presenterSpy.didReceiveLoadViewMessage, @"Presenter should have receved the fetchData message");
}

- (void)testCartButtonIsPresent {
    XCTAssertTrue(self.sut.cartButton!=nil, @"There should be a cart button");
}

- (void) testCartButtonIsHookedUpToTheProperEvent {
    NSArray *actions = [self.sut.cartButton actionsForTarget:self.sut forControlEvent:UIControlEventTouchUpInside];
    XCTAssertTrue([actions containsObject:@"cartButtonPressed:"], @"Cart button should be hooked up to proper action");
}
@end
