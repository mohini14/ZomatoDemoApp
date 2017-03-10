//
//  SessionData.h
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 06/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityDetails.h"
#import "Collection.h"
#import "Resturant.h"

@interface SessionData : NSObject

@property (strong,nonatomic) CityDetails *currentCityDetails;
@property (strong,nonatomic) NSString *currentSelectedLocationButtonTitle;
@property (strong,nonatomic) Collection *collection;
@property (strong,nonatomic) Resturant *resturant;
@property  double lat;
@property double lon;


+(instancetype)getInstance;



@end
