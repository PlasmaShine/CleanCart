//
//  ListItemsCellEventHandlerIO.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/5/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

@protocol ListItemsCellEventHandlerRequest

- (void)didTapAddToCartForItemId:(NSString *)itemID;
    
@end

@protocol ListItemsCellEventHandlerResponse
    
@end
