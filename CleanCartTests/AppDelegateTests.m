//
//  AppDelegateTests.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AppDelegateStub.h"
#import "NavigatorFactorySpy.h"
#import "NavigationMessage.h"

@interface AppDelegateTests : XCTestCase

@property (nonatomic, strong) AppDelegateStub *sut;

@end

@implementation AppDelegateTests

- (void)setUp {
    [super setUp];
    UIWindow *window = [[UIWindow alloc] init];
    self.sut = [[AppDelegateStub alloc] init];
    self.sut.window = window;
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

#pragma mark - Tests

- (void)testAppDelegateInitializationCallsNaviGatorFactoryWithRootMessage {
    NavigatorFactorySpy *factorySpy = [[NavigatorFactorySpy alloc] init];
    self.sut = [[AppDelegateStub alloc] initWithFactory:factorySpy];
    [self.sut application:nil didFinishLaunchingWithOptions:nil];
    XCTAssertTrue(factorySpy.didReceiveNavigationMessage, @"Should have received the root message");
    XCTAssertEqual(factorySpy.receivedMessage, NavigationMessageRoot, @"Parameter passed to the factory should have been root");
}

- (void)testAppDelegateRootViewControllerIsANavigationController {
    [self.sut application:nil didFinishLaunchingWithOptions:nil];
    XCTAssertNotNil(self.sut.window);
    XCTAssertTrue([self.sut.window.rootViewController isKindOfClass:[UINavigationController class]], @"Root view controller should be a navigation controller");
}

@end
