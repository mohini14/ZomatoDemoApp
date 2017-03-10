//
//  SearchedResultsCVCellTableViewCell.h
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 07/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityDetails.h"

@interface SearchedResultsCVCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryNameLabel;

-(void) setUpCellAttributes : (CityDetails *)city;

@end
