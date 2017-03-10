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
#import "ResturantCollectionCell.h"
#import "Resturant.h"

#define KRESTURANT_COLLECTION_COLLECTION_CELL @"CollectionViewCell"
#define KRESTURANT_COLLECTION_COLLECTION_CELL_IDENTIFIER @"Cell"
#define KRESTURANT_cOLLECTION_CELL_IDENTIFIER @"ResturantCell"
#define KRESTURANT_COLLECTION_CELL @"ResturantCollectionCell"

#define KUNWIND_SEGUE_IDENTIFIER_FRM_LOCATION @"unwindfromLocation"
#define KUNWIND_SEGUE_IDENTIFIER_FRM_RESTURANT @"HomeToResturant"

@interface HomeViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *selectLocationButton;
@property (strong,nonatomic) NSString *selectLocationButtonTitle;
@property (strong,nonatomic) SessionData *session;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *allResturantsCollectionView;


-(IBAction)unwindfromLocation:(UIStoryboardSegue *)unwindSegue;

@end
