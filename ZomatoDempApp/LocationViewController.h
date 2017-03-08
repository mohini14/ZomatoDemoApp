//
//  LocationViewController.h
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 07/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataParser.h"
#import "SearchedResultsCVCellTableViewCell.h" 
#import "CityDetails.h"
#import "AlertDisplay.h"
#import "Define.h"
#import "LocationManager.h"
#import "HomeViewController.h"
#import "SessionData.h"

@interface LocationViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISearchBar *locationSearchBar;
@property (weak, nonatomic) IBOutlet UIButton *detectMyLocationButton;
@property (weak, nonatomic) IBOutlet UITableView *searchedResultsTable;
@property (weak, nonatomic) IBOutlet UITableView *recentlySearchedPlacesTable;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchedResultsTableHieght;
@property (strong,nonatomic) HomeViewController *homeVCObj;


- (IBAction)searchButton:(id)sender;
- (IBAction)detectMyLocationButtonPressed:(id)sender;

@end
