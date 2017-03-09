//
//  parser.h
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"
#import "Services.h"
#import "Category.h"
#import "CityDetails.h"
#import "Location.h"
#import "SessionData.h"
#import "Collection.h"
#import "ComposeURL.h"
#import "Resturant.h"

#define KZOMATO_CITY_RESOURCE @"cities"
#define KZOMATO_LOCATION_RESOURCE @"locations"
#define KZOMATO_SEARCH_RESOURSE @"search"
#define KZOMATO_COLLECTIONS_RESOURSE @"collections"
#define  KZOMATO_LOCATION_SUGGESTION_KEY @"location_suggestions"
#define KZOMATO_RESTURANTS_KEY @"restaurants"
#define KZOMATO_LIMIT_FETCHED_RESULTS @10
#define KZOMATO_FIXED_RADIUS @500


@interface DataParser : NSObject


+(void) getCityDetails :(NSString *)citySearch withCompletionHandler :(void (^) (NSArray * cityDetails ,NSString * errorMsg))callBackToMainVC;
+(void) getLocation :(double)lat withLongitude :(double)lon withCompletionHandler :(void (^)(CityDetails *city,NSString *errorMsg))callBackToMainVC;
+(void) getCollections:(double)lat withLongitude:(double)lon withCompletionHandler :(void (^) (NSArray *array,NSString *errorMsg))callBackToMainVC;
+(void) getAllResturants :(void (^) (NSArray *array,NSString *errorMsg))callBackToMAinVC;

@end
