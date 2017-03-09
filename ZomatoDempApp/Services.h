//
//  Services.h
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"

#define K_REQUEST_GET_TYPE @"GET"
#define K_USERKEY_KEY @"user-Key"


@interface Services : NSObject

+(void) makeRequest :(NSString *)urlString  withCompletionHandler :(void (^)(NSURLRequest *request))callBackToParser;
+ (void) sendRequest:(NSURLRequest *) request completionHandler:(void (^) (NSDictionary *,NSString *))callbackToParser;

@end
