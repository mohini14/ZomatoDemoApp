//
//  ResturantViewController.h
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 10/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SessionData.h"

@interface ResturantViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *ResturantImage;

@property (weak, nonatomic) IBOutlet UILabel *restRating;
@property (weak, nonatomic) IBOutlet UILabel *restName;
@property (weak, nonatomic) IBOutlet UILabel *restAdress;
@property (weak, nonatomic) IBOutlet UILabel *avrgCostForTwo;



@end
