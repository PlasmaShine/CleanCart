//
//  ListItemsPresenter.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/27/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ListItemsPresenter.h"
#import "Section.h"
#import "NavigationMessage.h"
#import "TransactionIdentifier.h"

@implementation ListItemsPresenter

#pragma mark - ListItemsPresenterIO

- (void)fetchData {
    Transaction *transaction = [self.transactionFactory createTransaction:ListItemsTransactionId forCaller:self andParameter:nil];
    [transaction execute];
}

- (void)cartButtonTapped {
    [self.navigator performNavigationForMessage:NavigationMessageShowCart];
}

- (void)didSelectItemWithId:(NSString *)itemId {
    [self.navigator performNavigationForMessage:NavigationMessageShowItemDetails];
}

- (void)addToCartItemWithId:(NSString *)itemId {
    
}

#pragma mark - ListItemsTranscationResponse

- (void)didReceiveItems:(NSArray *)items {
    NSArray *sectionList = [self _sectionListWithTwoItemsPerSectionForArray:items];
    [self.delegate refreshUIWithData:sectionList];
}

- (NSArray *)_sectionListWithTwoItemsPerSectionForArray:(NSArray *)items {
    NSMutableArray *sectionList = [NSMutableArray array];
    Section *section = nil;
    NSMutableArray *sectionItems = nil;
//    for (NSInteger i=0; i<items.count; i++) {
//        if (i%2==0) {
//            section = [[Section alloc] init];
//            sectionItems = [NSMutableArray array];
//        }
//        [sectionItems addObject:items[i]];
//        if (i%2!=0) {
//            section.items = sectionItems;
//            [sectionList addObject:section];
//            sectionItems = nil;
//        }
//    }
//    if (sectionItems.count>0) {
//        section.items = sectionItems;
//        [sectionList addObject:section];
//    }
    return sectionList;
}

@end
