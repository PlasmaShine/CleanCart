//
//  ItemRepositorySpy.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/23/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ItemRepositorySpy.h"

@implementation ItemRepositorySpy

- (instancetype)init {
    if (self = [super init]) {
        self.didReceiveItemRetrievalMessage = NO;
    }
    return self;
}

- (NSArray *)allItems {
    self.didReceiveAllItemsMessage = YES;
    return [NSArray array];
}
    

- (void)didReceiveItems:(NSArray *)items {
    self.didReceiveItemRetrievalMessage = YES;
}

@end
