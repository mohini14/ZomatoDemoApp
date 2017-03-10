//
//  Resturant.h
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 09/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "CacheManager.h"

#define KZOMATO_RESURANT_ID @"id"
#define KZOMATO_RESTURANT_NAME @"name"
#define KZOMATO_RESTURANT_URL @"url"
#define KZOMATO_RESTURANT_PHOTO_URL @"thumb"
#define KZOMATO_RESTURANT_KEY @"restaurant"
#define KZOMATO_RESTURANT_USER_RATING_KEY @"user_rating"
#define KZOMATO_AGGREGATE_RATTING @"aggregate_rating"
#define KZOMATO_LOCATION_KEY @"location"
#define KZOMATO_AVERAGE_COST_KEY @"average_cost_for_two"
#define KZOMATO_ADRESS_KEY @"address"

@interface Resturant : NSObject

@property NSNumber *iD;
@property NSString *name;
@property NSString *url;
@property NSString *photoURL;
@property UIImage *image;
@property NSNumber *rating;
@property  NSString *adress;
@property NSNumber *averageCostForTwo;
@property(nonatomic) BOOL imageLoaded;

-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
