//
//  StringOperations.m
//  ZomatoDempApp
//
//  Created by Mohini on 08/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "StringOperations.h"

@implementation StringOperations

+(NSURL *) composeURL :(NSURL *) queryParameters withResource :(NSString *)resource
{
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@%@",ZOMATO_URL_HOST,ZOMATO_API,ZOMATO_VERSION,resource,queryParameters]];
    return url;
}

@end
