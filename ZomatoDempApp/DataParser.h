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
#import "StringOperations.h"

@interface DataParser : NSObject

+(void) getCategories :(void (^)(NSArray *categories,NSString * errorMsg))callBackToMainVC;
+(void) getCityDetails :(NSString *)citySearch withCompletionHandler :(void (^) (NSArray * cityDetails ,NSString * errorMsg))callBackToMainVC;
+(void) getLocation :(double)lat withLongitude :(double)lon withCompletionHandler :(void (^)(CityDetails *city,NSString *errorMsg))callBackToMainVC;
@end
