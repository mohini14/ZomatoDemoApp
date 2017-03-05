//
//  ViewController.m
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.collections=@[[UIImage imageNamed:@"Monkey_Munch_food_card.jpg"],[UIImage imageNamed:@"Monkey_Munch_food_card.jpg"],[UIImage imageNamed:@"Monkey_Munch_food_card.jpg"],[UIImage imageNamed:@"Monkey_Munch_food_card.jpg"],[UIImage imageNamed:@"Monkey_Munch_food_card.jpg"],[UIImage imageNamed:@"Monkey_Munch_food_card.jpg"],[UIImage imageNamed:@"Monkey_Munch_food_card.jpg"],[UIImage imageNamed:@"Monkey_Munch_food_card.jpg"],[UIImage imageNamed:@"Monkey_Munch_food_card.jpg"],[UIImage imageNamed:@"Monkey_Munch_food_card.jpg"]];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Cell"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark-COLLECTION VIEW DELEGATES
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.collections.count;
}

-(UICollectionViewCell *) collectionView :(UICollectionView *) collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.cellImage.image=_collections[indexPath.row];
    return cell;
    
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 100);
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
@end
