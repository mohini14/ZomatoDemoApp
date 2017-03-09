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
#import "StringOperations.h"

#define KSERACH_RESULTS_TABLE_VIEW_CELL_IDENTIFIER @"LocationResults"
#define KSERACH_RESULT_TABLE_VIEW_CELL_XIB @"SearchedResultsCVCellTableViewCell"
#define KSERACH_RESULT_TABLE_VIEW_CELL_CLASS @"SearchedResultsCVCellTableViewCell.h"
#define KUNWIND_SEGUE_TO_HOMEVC_IDENTIFIER @"unwindfromLocation"

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
