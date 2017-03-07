//
//  LocationManager.h
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 07/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Define.h"


typedef void (^CompletionHandlerBlock)(double latitude,double longitude,NSError *error);

@interface LocationManager : NSObject<CLLocationManagerDelegate>

@property (strong,nonatomic) CLLocationManager *locationManager;
@property (strong,nonatomic) CompletionHandlerBlock completionHandlerBlock;
@property(nonatomic) BOOL isLocationUpdated;

+(instancetype) getInstance;

-(void) getLocation :(void (^) (double latitude,double longitude,NSError *error))completionHandler;


@end
