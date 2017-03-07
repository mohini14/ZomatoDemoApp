//
//  Location.m
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 06/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "Location.h"

@implementation Location


-(instancetype) initWithDictionary:(NSDictionary*)dictionary
{
	self = [super init];
	if (self && dictionary){
		self.city_id=dictionary[KCITY_ID_KEY];
		self.city_name=dictionary[KCITY_NAME_KEY];
		self.country_id=dictionary[KCOUNTRY_ID_KEY];
		self.country_name=dictionary[KCOUNTRY_NAME];
		self.lat=[dictionary[KLATITUDE_KEY] doubleValue];
		self.lon=[dictionary[KLONGITUDE_KEY]doubleValue];
		return self;
	}
	return nil;
	
}

@end
