//
//  Location.h
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 06/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#define KCITY_ID_KEY @"city_id"
#define KCITY_NAME_KEY @"city_name"
#define KCOUNTRY_ID_KEY @"country_id"
#define KLATITUDE_KEY @"latitude"
#define KLONGITUDE_KEY @"longitude"
#define KCOUNTRY_NAME @"country_name"

@interface Location : NSObject

@property NSNumber *city_id;
@property NSString *city_name;
@property double lat;
@property double lon;
@property NSString *country_name;
@property NSNumber *country_id;

@end
