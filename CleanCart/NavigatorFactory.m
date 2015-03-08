//
//  NavigatorFactory.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/8/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "NavigatorFactory.h"
#import "ListItemsViewController.h"
#import "ListItemsPresenter.h"
#import "ListItemsNavigator.h"
#import "TransactionFactory.h"

@interface NavigatorFactory()

@property (nonatomic, strong) TransactionFactory *transactionFactory;

@end

@implementation NavigatorFactory

- (instancetype)init {
    if (self = [super init]) {
        self.transactionFactory = [[TransactionFactory alloc] init];
    }
    return self;
}

- (Navigator *)navigatorForMessage:(NavigationMessage)message {
    switch(message) {
        case NavigationMessageRoot: {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            UINavigationController *navigationController = [storyboard instantiateInitialViewController];
            ListItemsViewController *listItemsVc = navigationController.viewControllers[0];
            ListItemsPresenter *listPresenter = [[ListItemsPresenter alloc] init];
            ListItemsNavigator *listNavigator = [[ListItemsNavigator alloc] init];
            listNavigator.navigatorFactory = self;
            listNavigator.rootViewController = navigationController;
            listItemsVc.eventHandler = listPresenter;
            listPresenter.transactionFactory = self.transactionFactory;
            listPresenter.delegate = listItemsVc;
            listPresenter.navigator = listNavigator;
            return listNavigator;
        }
        default:
            return nil;
    }
}

@end
