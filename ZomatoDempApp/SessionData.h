//
//  SessionData.h
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 06/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityDetails.h"

@interface SessionData : NSObject

@property (strong,nonatomic) CityDetails *currentCityDetails;
@property (strong,nonatomic) NSString *currentSelectedLocationButtonTitle;
@property  double lat;
@property double lon;


+(instancetype)getInstance;



@end
