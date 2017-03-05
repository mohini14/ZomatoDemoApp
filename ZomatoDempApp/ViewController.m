//
//  ViewController.m
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "ViewController.h"
#import "Category.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    self.collections=@[];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpVC];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpVC{

    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [parser getCategories:^(NSArray *categories, NSString *errorMsg)
    {
        if(errorMsg!=nil)
        {
            [AlertDisplay showAlertPopupWithTitle:errorMsg forView:self];
            
        }
        else
        {
            [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Cell"];
            self.collections=categories;
            [self.collectionView reloadData];
            
        }
    }];
    
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
    Category *cat = self.collections[indexPath.row];
    cell.nameLable.text=cat.name;
    return cell;
    
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 50);
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(2, 2, 2, 2);
}
@end
