//
//  HomeViewController.m
//  ZomatoDempApp
//
//  Created by Mohini on 06/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpVC];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources th
}


-(void) setUpVC
{
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
    [self setUpTabBar];
    

}

-(void) setUpTabBar
{
    UITabBarItem *tabBarItem1 = [self.tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [self.tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [self.tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [self.tabBar.items objectAtIndex:3];
    UITabBarItem *tabBarItem5 = [self.tabBar.items objectAtIndex:4];
    
    tabBarItem1.title = @"Home";
    tabBarItem2.title = @"collections";
    tabBarItem3.title = @"";
    tabBarItem4.title = @"Feed";
    tabBarItem5.title = @"Account";
//    
//    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"home_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"home.png"]];
//    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"maps_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"maps.png"]];
//    [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@"myplan_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"myplan.png"]];
//    [tabBarItem4 setFinishedSelectedImage:[UIImage imageNamed:@"settings_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"settings.png"]];
//    
////    return YES;
}
@end
