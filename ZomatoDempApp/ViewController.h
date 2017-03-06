//
//  ViewController.h
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
#import "DataParser.h"
#import "AlertDisplay.h"
#import "SearchBar.h"
#import "SessionData.h"

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic) NSArray *collections;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong,nonatomic) CollectionViewCell *Collectioncell;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *serchBarButton;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


- (IBAction)searchButtonPressed:(UIBarButtonItem *)sender;
@end

