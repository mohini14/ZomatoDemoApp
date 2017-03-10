//
//  HomeViewController.m
//  ZomatoDempApp
//
//  Created by Mohini on 06/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "HomeViewController.h"
#define KYOUR_LOCATION_BUTTON_TITLE @ "YOUR LOCATION"
#define KNUMBER_OF_SECTIONS_IN_COLLECTION_VIEW 1
#define KCOLLECTION_COLLECTIONVIEW_WIDTH 150
#define KCOLLECTION_COLLECTIONVIEW_HIEGHT 100
#define KRESTURANT_COLLECTIONVIEW_WIDTH 190
#define KRESTURANT_COLLECTIONVIEW_HIEGHT 120


@interface HomeViewController ()

@end

@implementation HomeViewController
{
	NSArray *collections;
	NSInteger clickedRow;
	NSArray *resturants;
    double lat;
    double lon;
}

#pragma mark - Initial VC setUp
- (void)viewDidLoad
{
    [super viewDidLoad];
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
}

//method sets the navigation bar items
-(void) setNavigationBarItems
{
	self.selectLocationButton.title=NSLocalizedString(KYOUR_LOCATION_BUTTON_TITLE, nil);
	[self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
}

//method displays the current location on navigation bar item as soon as Home page opens
-(void) setCurrentLocationButton
{
	//method gets current locations latitude and longitude
	[[LocationManager getInstance]getLocation:^(double latitude, double longitude, NSError *error)
	 {
		 if(error==nil)
		 {
			 //saving current location latitude,longitude etc in session Data
			 SessionData *session=[SessionData getInstance];
			 session.lon=longitude;
			 session.lat=latitude;
			 
			 //using weak self to avoid strong  retain cycle in block for self object
			 ////////__weak HomeViewController *weakSelf = self;

			 //method gets the current location name on the basis of lat and longitude provided
			 [DataParser getLocation:latitude withLongitude:longitude withCompletionHandler:^(CityDetails *city, NSString *errorMsg)
			  {
				  if(errorMsg==nil)
				  {
					  //saving the current city details in session data property
					  session.currentCityDetails=city;
					  self.selectLocationButton.title=city.name;
					  [self setUpCollectionView];
                      [self setUpResturantCollectionView];
				  }
			  }];
			 
		 }
		 else
		 {
			 [AlertDisplay showAlertPopupWithTitle:KDATA_FETCHING_ERROR_MESSAGE forView:self];
		 }
	 }];
}


// method sets up collection view displaying collection in a city
-(void) setUpCollectionView
{
	self.collectionView.delegate=self;
	self.collectionView.dataSource=self;
	[self.collectionView registerNib:[UINib nibWithNibName:KRESTURANT_COLLECTION_COLLECTION_CELL bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:KRESTURANT_COLLECTION_COLLECTION_CELL_IDENTIFIER];
	[self populateDataInCollectionView];
}

//method populates collection view every time data is fetched
-(void) populateDataInCollectionView
{
	SessionData *session=[SessionData getInstance];
	[DataParser getCollections:session.lat withLongitude:session.lon withCompletionHandler:^(NSArray *array, NSString *errorMsg) {
		if(errorMsg==nil)
		{
			collections=array;
			[self.collectionView reloadData];
            
		}
		else
		{
			[AlertDisplay showAlertPopupWithTitle:KDATA_FETCHING_ERROR_MESSAGE forView:self];
		}
	}];
}



//method sets up collection View that displays collection view that shows  the list of all resturants
-(void) setUpResturantCollectionView
{
	self.allResturantsCollectionView.delegate=self;
	self.allResturantsCollectionView.dataSource=self;
	[self.allResturantsCollectionView registerNib:[UINib nibWithNibName:KRESTURANT_COLLECTION_CELL bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:KRESTURANT_cOLLECTION_CELL_IDENTIFIER];
	[self populateDataInResturantCollectionView];
}


//method populates data in resturant collection view
-(void) populateDataInResturantCollectionView
{
	//SessionData *session=[SessionData getInstance];
	[DataParser getAllResturants:^(NSArray *array, NSString *errorMsg)
	{
	if(errorMsg==nil)
		{
			resturants=array;
			[self.allResturantsCollectionView reloadData];
			//using NSTimer to see if all images are loaded or not
			[NSTimer scheduledTimerWithTimeInterval:2.0 repeats:YES block:^(NSTimer *timer){
				BOOL allImagesLoaded = YES;
                [self.allResturantsCollectionView reloadData];
				for(Resturant *res in resturants) {
					if (res.imageLoaded == FALSE)
						allImagesLoaded = NO;
				}
				if(allImagesLoaded)
					[timer invalidate];
			}];
		}
		else
		{
			[AlertDisplay showAlertPopupWithTitle:KDATA_FETCHING_ERROR_MESSAGE forView:self];
		}
	}];
	
}


#pragma mark-Collection View Delegate and DataSource Methods
//delegate method to get the number of rows
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	if(collectionView==self.collectionView)
    return collections.count;
	else
	return resturants.count;
}

//delegate method to get the number of sections
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return KNUMBER_OF_SECTIONS_IN_COLLECTION_VIEW;
}

//delegate method sets the cell at indexPath
-(UICollectionViewCell *)collectionView :(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
	if(collectionView==self.collectionView)
	{
    CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:KRESTURANT_COLLECTION_COLLECTION_CELL_IDENTIFIER forIndexPath:indexPath];
	Collection *collection=collections[indexPath.row];
	[cell setUpCollectionViewCell:collection]; //method sets up the object of the cell
	return cell;
	}
	else
	{
	 ResturantCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:KRESTURANT_cOLLECTION_CELL_IDENTIFIER forIndexPath:indexPath];
	Resturant *resturant=resturants[indexPath.row];
	[cell setUpCollectionViewCell:resturant];   //method sets up the object of the cell
	return cell;
	}
	
    
}

//delegate method called when a row is clicked
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	clickedRow=indexPath.row;
	SessionData *session=[SessionData getInstance];
	session.resturant=resturants[clickedRow];
	[self performSegueWithIdentifier:KUNWIND_SEGUE_IDENTIFIER_FRM_RESTURANT sender:self];
}


#pragma mark- Collection View Cell Layout methods
-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
	if(collectionView==self.collectionView)
	{
		return CGSizeMake(KCOLLECTION_COLLECTIONVIEW_WIDTH,KCOLLECTION_COLLECTIONVIEW_HIEGHT);
	}
	else
	{
		return CGSizeMake(KRESTURANT_COLLECTIONVIEW_WIDTH, KRESTURANT_COLLECTIONVIEW_HIEGHT);
	}
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(KZERO_INT_CONST, KZERO_INT_CONST, KZERO_INT_CONST, KZERO_INT_CONST);
}



#pragma mark-UNWIND SEGUE
//segue to come back from location VC
-(IBAction) unwindfromLocation:(UIStoryboardSegue *)unwindSegue
{
	 self.session=[SessionData getInstance];
	if([unwindSegue.identifier isEqualToString:KUNWIND_SEGUE_IDENTIFIER_FRM_LOCATION]){
		self.selectLocationButton.title=self.session.currentSelectedLocationButtonTitle;
        [self populateDataInCollectionView];
        [self populateDataInResturantCollectionView];
	}
	
	
}

-(IBAction)unwindFromResturant:(UIStoryboardSegue *)unwindSegue
{
	
}




@end
