//
//  ItemRepositoryIO.h
//  CleanCart
//
//  Created by Nemes Norbert on 2/26/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

@protocol ItemRepositoryResponse <NSObject>

- (void)didReceiveItems:(NSArray *)items;

@end
