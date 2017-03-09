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
#define KZOMATO_RESTURANT_PHOTO_URL @"photos_url"
#define KZOMATO_RESTURANT_KEY @"restaurant"
#define KZOMATO_RESTURANT_R_KEY @"R"
#define KZOMATO_RESTURANT_USER_RATING_KEY @"user_rating"

@interface Resturant : NSObject

@property NSNumber *iD;
@property NSString *name;
@property NSString *url;
@property NSString *photoURL;
@property UIImage *image;

-(instancetype) initWithDictionary:(NSDictionary*)dictionary;

@end
