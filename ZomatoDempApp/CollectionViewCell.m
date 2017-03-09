//
//  CollectionViewCell.m
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

// method sets up the collection view cell elements
-(void) setUpCollectionViewCell :(Collection *)collection
{
	self.image.image=collection.collectionImage;
	self.titleLabel.text=collection.title;
}
@end
