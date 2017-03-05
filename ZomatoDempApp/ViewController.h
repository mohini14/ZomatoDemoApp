//
//  ViewController.h
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic) NSArray *collections;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

