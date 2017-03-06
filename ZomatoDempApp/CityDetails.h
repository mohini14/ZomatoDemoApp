//
//  CityDetails.h
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 06/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#define KCITY_ID @"id"
#define KCITY_NAME @"name"
#define KCOUNTRY_NAME @"country_name"
#define KCOUNTRY_ID @"country_id"

@interface CityDetails : NSObject

@property NSNumber * city_id;
@property NSString *name;
@property NSString *country_name;
@property NSNumber *country_id;

-(instancetype) initWithDictionary:(NSDictionary*)dictionary;

@end
