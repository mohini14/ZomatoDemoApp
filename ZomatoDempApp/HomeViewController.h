//
//  HomeViewController.h
//  ZomatoDempApp
//
//  Created by Mohini on 06/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SessionData.h"



@interface HomeViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *selectLocationButton;
@property (strong,nonatomic) NSString *selectLocationButtonTitle;
@property (strong,nonatomic) SessionData *session;

-(IBAction)unwindfromLocationVC:(UIStoryboardSegue *)unwindSegue;
-(IBAction)unwindfromLocation:(UIStoryboardSegue *)unwindSegue;

@end
