//
//  ItemrepositoryStub.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/9/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ItemRepositoryStub.h"

@implementation ItemRepositoryStub

- (Item *)itemForId:(NSString *)itemId {
    if([self.item.itemId isEqualToString:itemId]) {
        return self.item;
    }
    return nil;
}

- (Item *)selectedItem {
    return self.item;
}

@end
