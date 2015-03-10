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
#import "ItemDetailsViewController.h"
#import "ItemDetailsViewController.h"
#import "ItemDetailsPresenter.h"
#import "ItemDetailsNavigator.h"

@interface NavigatorFactory()

@property (nonatomic, strong) TransactionFactory *transactionFactory;
@property (nonatomic, strong) UIStoryboard *mainStoryboard;
@end

@implementation NavigatorFactory

- (instancetype)init {
    if (self = [super init]) {
        self.transactionFactory = [[TransactionFactory alloc] init];
        self.mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    }
    return self;
}

- (Navigator *)navigatorForMessage:(NavigationMessage)message {
    switch(message) {
        case NavigationMessageRoot: {
            return [self _createListItemsStack];
        }
        case NavigationMessageShowItemDetails: {
            return [self _createItemDetailsStack];
        }
        default:
            return nil;
    }
}

#pragma mark - ListItems -

- (Navigator *)_createListItemsStack {
    UINavigationController *navigationController = [self.mainStoryboard instantiateInitialViewController];
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

#pragma mark - ItemDetails -

- (Navigator *)_createItemDetailsStack {
    ItemDetailsViewController *itemDetailsController = [self.mainStoryboard instantiateViewControllerWithIdentifier:@"ItemDetailsViewController"];
    ItemDetailsPresenter *itemDetailsPresenter = [[ItemDetailsPresenter alloc] init];
    ItemDetailsNavigator *itemDetailsNavigator = [[ItemDetailsNavigator alloc] init];
    itemDetailsNavigator.navigatorFactory = self;
    itemDetailsNavigator.rootViewController = itemDetailsController;
    itemDetailsController.eventHandler = itemDetailsPresenter;
    itemDetailsPresenter.transactionFactory = self.transactionFactory;
    itemDetailsPresenter.delegate = itemDetailsController;
    itemDetailsPresenter.navigator = itemDetailsNavigator;
    return itemDetailsNavigator;
}

@end
