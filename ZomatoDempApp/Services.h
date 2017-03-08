//
//  Services.h
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"

@interface Services : NSObject

+(void) makeRequest :(NSString *)urlString  withCompletionHandler :(void (^)(NSURLRequest *request))callBackToParser;
+ (void) sendRequest:(NSURLRequest *) request completionHandler:(void (^) (NSDictionary *,NSString *))callbackToParser;
//+(void) makeRequestWithParametres :(NSString *)urlString withService :(NSString *)service withCompletionHandler:(void (^)(NSURLRequest *request))callBackToParser;
@end
