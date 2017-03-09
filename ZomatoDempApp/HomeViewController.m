//
//  HomeViewController.m
//  ZomatoDempApp
//
//  Created by Mohini on 06/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "HomeViewController.h"
#define KNUMBER_OF_SECTIONS_IN_COLLECTION_VIEW 1;

@interface HomeViewController ()

@end

@implementation HomeViewController{
	NSArray *resturants;
    double lat;
    double lon;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.selectLocationButton.title=@ "YOUR LOCATION";
	self.session.currentSelectedLocationButtonTitle=self.selectLocationButton.title;
	[self setUpVC];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
	
}


-(void) setUpVC
{

	
	[self setNavigationBarItems];
    [self setCurrentLocationButton];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Cell"];

}

-(void) setCurrentLocationButton
{
    [[LocationManager getInstance]getLocation:^(double latitude, double longitude, NSError *error)
     {
         NSLog(@"%f,%f",longitude,longitude);
         if(error==nil)
         {
             lat=latitude;
             lon=longitude;
             [DataParser getLocation:lat withLongitude:lon withCompletionHandler:^(CityDetails *city, NSString *errorMsg)
              {
                  //NSString *str=[NSString stringWithFormat:@"%@%@",@"city :",city.name];
                  
                      SessionData *session=[SessionData getInstance];
                    session.currentCityDetails=city;
                   session.lon=lon;
                   session.lat=lat;
                      session.currentCityDetails=city;
              }];
             
         }
         else
         {
             [AlertDisplay showAlertPopupWithTitle:@"Error in Fetching Your Location" forView:self];
         }
     }];

}
-(void) setNavigationBarItems{
	
	
	[self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];


}

#pragma mark-Collection View Delegate Methods
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return resturants.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return KNUMBER_OF_SECTIONS_IN_COLLECTION_VIEW;
}

-(UICollectionViewCell *)collectionView :(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    //Category *cat = self.collections[indexPath.row];
   // cell.nameLable.text=cat.name;
    return cell;
    
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100,50);
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(2, 2, 2, 2);
}
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    clickedItem=indexPath.row;
//
//}



#pragma mark-UNWIND SEGUE
-(IBAction)unwindfromLocationVC:(UIStoryboardSegue *)unwindSegue
{
	//to come back from signup view controller
}

-(IBAction)unwindfromLocation:(UIStoryboardSegue *)unwindSegue
{
	 self.session=[SessionData getInstance];
	if([unwindSegue.identifier isEqualToString:@"unwindfromLocation"]){
		self.selectLocationButton.title=self.session.currentSelectedLocationButtonTitle;
	}
	
	
}




@end
