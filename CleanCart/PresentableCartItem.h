//
//  PresentableCartItem.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/19/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PresentableCartItem : NSObject

@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *itemQuantity;

@end
