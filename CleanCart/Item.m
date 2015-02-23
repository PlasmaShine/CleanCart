//
//  Item.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/23/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "Item.h"

@implementation Item

- (instancetype)initWithJSON:(NSDictionary *)json {
    if (self = [super init]) {
        self.itemId = json[@"id"];
        self.itemName = json[@"name"];
        self.itemDescription = json[@"description"];
        self.itemPrice = [json[@"price"] integerValue];
        self.itemStock = [json[@"stock"] integerValue];
    }
    return self;
}
@end
