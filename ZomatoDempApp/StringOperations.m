//
//  StringOperations.m
//  ZomatoDempApp
//
//  Created by Mohini on 08/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "StringOperations.h"

@implementation StringOperations

//+(NSURL *) composeURL :(NSURL *) queryParameters withResource :(NSString *)resource
//{
//	
//    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@%@",ZOMATO_URL_HOST,ZOMATO_API,ZOMATO_VERSION,resource,queryParameters.absoluteString]];
//    return url;
//}
//

+(BOOL) isInteger :(NSString *)obj
{
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	NSNumber *number = [formatter numberFromString:obj];
	if(number!=nil)
		return YES;
	else
		return NO;
}

@end
