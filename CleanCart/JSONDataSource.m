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
@synthesize delegate = _delegate;

- (void)setDelegate:(id<DataSourceResponse>)delegate {
    //You should check if your delegates conform to all the required protocols
    //and throw an exception if not. This is in case you do something
    //stupid, you find out about it fast and not have to debug for hours/days
    if (delegate && ![delegate conformsToProtocol: @protocol(DataSourceResponse)]) {
        [[NSException exceptionWithName: NSInvalidArgumentException reason: @"Delegate object does not conform to the proper protocol" userInfo: nil] raise];
    }
    _delegate = delegate;
}

#pragma mark - DataSourceRequest methods

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
