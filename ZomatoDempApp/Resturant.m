//
//  Resturant.m
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 09/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "Resturant.h"

@implementation Resturant

-(instancetype) initWithDictionary:(NSDictionary*)dictionary
{
	self = [super init];
	if (self && dictionary){
		
		self.iD=dictionary[KZOMATO_RESTURANT_KEY][KZOMATO_RESURANT_ID];
		self.name=dictionary[KZOMATO_RESTURANT_KEY][KZOMATO_RESTURANT_NAME];
		self.url=dictionary[KZOMATO_RESTURANT_KEY][KZOMATO_RESTURANT_URL];
		self.photoURL=dictionary[KZOMATO_RESTURANT_KEY][KZOMATO_RESTURANT_PHOTO_URL];
		self.rating=dictionary[KZOMATO_RESTURANT_KEY][KZOMATO_RESTURANT_USER_RATING_KEY][KZOMATO_AGGREGATE_RATTING];
		self.adress=dictionary[KZOMATO_RESTURANT_KEY][KZOMATO_LOCATION_KEY][KZOMATO_ADRESS_KEY];
		self.averageCostForTwo=dictionary[KZOMATO_RESTURANT_KEY][KZOMATO_AVERAGE_COST_KEY];
		self.image = nil;
		self.imageLoaded = FALSE;
		[self getImage:^(UIImage *image) {
			self.image=image;
		}];
		return self;
	}
	
	return nil;
}


//method to get image from Cached Data
-(void) getImage :(void (^)(UIImage * image))callBack{
	
	[[CacheManager getInstance]imageForURL:self.photoURL withCompletionHandler:^(UIImage *image) {
		self.imageLoaded = TRUE;
		callBack(image);
	}];
	
}

@end
