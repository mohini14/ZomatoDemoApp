//
//  CityDetails.m
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 06/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "CityDetails.h"

@implementation CityDetails
-(instancetype) initWithDictionary:(NSDictionary*)dictionary
{
	self = [super init];
	if (self && dictionary){
		self.city_id=dictionary [KCITY_ID];
		self.name=dictionary[KCITY_NAME];
		self.country_name=dictionary[KCOUNTRY_NAME];
		self.country_id=dictionary[KCOUNTRY_ID];
		return self;
	}
	return nil;
	
}

@end
