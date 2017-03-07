//
//  LocationManager.m
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 07/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager
+(instancetype) getInstance
{
	static LocationManager *instanceVar=nil;
	if(instanceVar != nil)
		return instanceVar;
	@synchronized (self)
	{
		if(instanceVar==nil)
		{
			instanceVar=[[LocationManager alloc]init];
			instanceVar.locationManager = [[CLLocationManager alloc] init];
			instanceVar.locationManager.delegate=instanceVar;
			instanceVar.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
		}
	}
	return instanceVar;
}


#pragma mark- to get  current location
//method returns the latitude and longitude of current location
-(void) getLocation :(void (^) (double latitude,double longitude,NSError *error))completionHandler{
	self.completionHandlerBlock=completionHandler;
	[self.locationManager startUpdatingLocation];
	self.isLocationUpdated = FALSE;
	
}


#pragma mark - Delegate Methods (CLLocationManager)
// method deals with error if CLLocationManager fails to update location
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
	self.completionHandlerBlock(0,0,error);
}
// method gives location if error is equal to nil
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	if(newLocation!=nil){
		if(self.isLocationUpdated == FALSE) {
			self.completionHandlerBlock(newLocation.coordinate.latitude, newLocation.coordinate.longitude, nil);
			self.isLocationUpdated = TRUE;
			[self.locationManager stopUpdatingLocation];
		}
	};
	
	
}



@end
