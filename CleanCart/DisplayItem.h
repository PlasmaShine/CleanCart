//
//  DisplayItem.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/1/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisplayItem : NSObject

@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *itemDescription;
@property (nonatomic, assign) NSInteger itemPrice;
@property (nonatomic, assign) NSInteger itemStock;

@end
