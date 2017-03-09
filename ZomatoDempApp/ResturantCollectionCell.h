//
//  ResturantCollectionCell.h
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 09/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Resturant.h"

@interface ResturantCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *resturantImage;
@property (weak, nonatomic) IBOutlet UILabel *resturantTitle;

-(void) setUpCollectionViewCell :(Resturant *)resturant;

@end
