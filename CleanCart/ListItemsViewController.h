//
//  ListItemsViewController.h
//  CleanCart
//
//  Created by Nemes Norbert on 3/2/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItemsPresenterIO.h"
#import "ListItemsCellEventHandlerIO.h"

@interface ListItemsViewController : UICollectionViewController <ListItemsPresenterResponse, ListItemsCellEventHandlerRequest>

@property (weak, nonatomic) IBOutlet UIButton *cartButton;

@property (nonatomic, strong) id<ListItemsPresenterRequest> eventHandler;

@end
