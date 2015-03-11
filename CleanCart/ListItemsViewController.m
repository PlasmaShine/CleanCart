//
//  ListItemsViewController.m
//  CleanCart
//
//  Created by Nemes Norbert on 3/2/15.
//  Copyright (c) 2015 Norbert Nemes. All rights reserved.
//

#import "ListItemsViewController.h"
#import "Section.h"
#import "ListItemsCollectionCell.h"

@interface ListItemsViewController ()

- (IBAction)cartButtonPressed:(id)sender;

@property (nonatomic, strong) NSArray *displayData;

@end

@implementation ListItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.eventHandler fetchData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.eventHandler viewWillAppear];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.eventHandler viewWillDisappear];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - ListItemsPresenterResponse

- (void)refreshUIWithData:(NSArray *)dataModel {
    self.displayData = dataModel;
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.displayData.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    Section *currentSection = self.displayData[section];
    return currentSection.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ListItemsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ListItemsCollectionCell"forIndexPath:indexPath];
    Section *section = self.displayData[indexPath.section];
    cell.item = section.items[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Section *section = self.displayData[indexPath.section];
    PresentableListItem *item = section.items[indexPath.row];
    [self.eventHandler didSelectItemWithId:(item.itemId)];
}

#pragma mark - Cart button pressed event

- (IBAction)cartButtonPressed:(id)sender {
    [self.eventHandler cartButtonTapped];
}

#pragma mark - ListItemsCellEventHandler methods

- (void)didTapAddToCartForItemId:(NSString *)itemID {
    [self.eventHandler addToCartItemWithId:itemID];
}

@end
