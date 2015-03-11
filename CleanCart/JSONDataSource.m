//
//  JSONDataSource.m
//  CleanCart
//
//  Created by Nemes Norbert on 2/23/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "JSONDataSource.h"
#import "Item.h"

@implementation JSONDataSource

- (void)fetchItems {
    NSArray *itemList = [self _loadItemsFromJSONFile];
    [self.delegate didReceiveItems:itemList];
}

- (NSArray *)_loadItemsFromJSONFile {
    NSMutableArray *result = [NSMutableArray array];
    NSDictionary *json = [self _loadJSONDictionary];
    if(json) {
        NSArray *jsonItemList = json[@"items"];
        if ([jsonItemList isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dictionary in jsonItemList) {
                Item *item = [[Item alloc] initWithJSON:dictionary];
                [result addObject:item];
            }
        }
    }
    return result;
}

- (NSDictionary *)_loadJSONDictionary {
    NSError *error = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ItemList" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (!error) {
        return json;
    } else {
        return nil;
    }
}

@end
