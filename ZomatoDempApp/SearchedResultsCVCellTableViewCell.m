//
//  SearchedResultsCVCellTableViewCell.m
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 07/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "SearchedResultsCVCellTableViewCell.h"

@implementation SearchedResultsCVCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// method sets up cell attributes
-(void) setUpCellAttributes : (CityDetails *)city
{
	self.cityNameLabel.text=city.name;
	self.countryNameLabel.text=city.country_name;
}

@end
