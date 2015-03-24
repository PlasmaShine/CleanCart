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
#import "TransactionFactory.h"
#import "ItemDetailsViewController.h"
#import "ItemDetailsViewController.h"
#import "ItemDetailsPresenter.h"

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

#pragma mark - Presenter Common Setup -

- (void)_setupCommonFeaturesForPresenter:(Presenter *)presenter withViewController: (UIViewController *)vc {
    Navigator *navigator = [[Navigator alloc] init];
    navigator.navigatorFactory = self;
    navigator.rootViewController = vc;
    presenter.navigator = navigator;
    presenter.transactionFactory = self.transactionFactory;
}

#pragma mark - ListItems -

- (Navigator *)_createListItemsStack {
    UINavigationController *navigationController = [self.mainStoryboard instantiateInitialViewController];
    ListItemsViewController *listItemsVc = navigationController.viewControllers[0];
    ListItemsPresenter *listPresenter = [[ListItemsPresenter alloc] init];
    [self _setupCommonFeaturesForPresenter:listPresenter withViewController:navigationController];
    listItemsVc.eventHandler = listPresenter;
    listPresenter.delegate = listItemsVc;
    return listPresenter.navigator;
}

#pragma mark - ItemDetails -

- (Navigator *)_createItemDetailsStack {
    ItemDetailsViewController *itemDetailsController = [self.mainStoryboard instantiateViewControllerWithIdentifier:@"ItemDetailsViewController"];
    ItemDetailsPresenter *itemDetailsPresenter = [[ItemDetailsPresenter alloc] init];
    [self _setupCommonFeaturesForPresenter:itemDetailsPresenter withViewController:itemDetailsController];
    itemDetailsController.eventHandler = itemDetailsPresenter;
    itemDetailsPresenter.delegate = itemDetailsController;
    return itemDetailsPresenter.navigator;
}

@end
