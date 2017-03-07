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

@interface DataParser : NSObject

+(void) getCategories :(void (^)(NSArray *categories,NSString * errorMsg))callBackToMainVC;
//+(NSURL *) composeURLWithParametersForLOCATION :(NSString *)citySearch;
+(void) getDetailsAboutCity :(NSString *)citySearch withCompletionHandler :(void (^) (NSArray * cityDetails ,NSString * errorMsg))callBackToMainVC;
//+(void) getLocation :(NSString *)citySearch withCompletionHandler :(void (^)(Location *loc))callBackToMainVC;

@end
