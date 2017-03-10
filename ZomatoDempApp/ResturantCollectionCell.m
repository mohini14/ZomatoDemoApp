//
//  ResturantCollectionCell.m
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 09/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "ResturantCollectionCell.h"

@implementation ResturantCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


//method sets up the attributes of the collection view
-(void) setUpCollectionViewCell :(Resturant *)resturant
{
	self.resturantImage.image=resturant.image;
	self.resturantTitle.text=resturant.name;
	self.resturantRating.text=resturant.rating;
}
@end
