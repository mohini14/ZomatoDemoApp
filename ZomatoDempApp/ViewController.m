//
//  ViewController.m
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "ViewController.h"
#import "Category.h"
#define KNUMBER_SECTION_COLLECION 1

@interface ViewController ()

@end

@implementation ViewController{
    NSInteger clickedItem;
}

- (void)viewDidLoad {
    self.collections=[[NSArray alloc]init];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpVC];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpVC{
	[self.searchBar setHidden:YES];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [DataParser getCategories:^(NSArray *categories, NSString *errorMsg)
    {
        if(errorMsg!=nil)
        {
            [AlertDisplay showAlertPopupWithTitle:errorMsg forView:self];
            
        }
        else
        {
            [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Cell"];
            self.collections=categories;
            [self.collectionView reloadData];
		}
	}];
}


#pragma mark-COLLECTION VIEW DELEGATES
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return KNUMBER_SECTION_COLLECION;
}


-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.collections.count;
}

-(UICollectionViewCell *) collectionView :(UICollectionView *) collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    Category *cat = self.collections[indexPath.row];
    cell.nameLable.text=cat.name;
    return cell;
    
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100,50);
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(2, 2, 2, 2);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    clickedItem=indexPath.row;
}

#pragma mark- VC IBActions methods
- (IBAction)searchButtonPressed:(UIBarButtonItem *)sender {
	[self.searchBar setHidden:NO];
	self.serchBarButton.tintColor = [UIColor clearColor];
	self.serchBarButton.enabled = NO;
	NSString *citySearch=self.searchBar.text;
//	[DataParser getDetailsAboutCity:citySearch withCompletionHandler:^(NSArray *cityDetails, NSString *errorMsg) {
//		SessionData *sessionData=[SessionData getInstance];
//		sessionData.currentCityDetails=cityDetails;
		
		
		
		
	//}];
	
	

	
	
		
	
	
}
@end
