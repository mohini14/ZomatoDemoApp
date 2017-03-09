//
//  HomeViewController.h
//  ZomatoDempApp
//
//  Created by Mohini on 06/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SessionData.h"
#import "CollectionViewCell.h"
#import "Location.h"
#import "CityDetails.h"
#import "LocationManager.h"
#import "AlertDisplay.h"
#import "DataParser.h"
#import "Define.h"

#define KRESTURANT_COLLECTION_COLLECTION_CELL @"CollectionViewCell"
#define KRESTURANT_COLLECTION_COLLECTION_CELL_IDENTIFIER @"Cell"
#define KNUMBER_OF_SECTIONS_IN_COLLECTION_VIEW 1;

@interface HomeViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *selectLocationButton;
@property (strong,nonatomic) NSString *selectLocationButtonTitle;
@property (strong,nonatomic) SessionData *session;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

-(IBAction)unwindfromLocation:(UIStoryboardSegue *)unwindSegue;

@end
