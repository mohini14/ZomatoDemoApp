//
//  ComposeURL.m
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 09/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "ComposeURL.h"

@implementation ComposeURL

#pragma mark-Composing URL QUERY PARAMETRS
//Method Uses NSURLComponents to convert a dict to URL query parameter type
+(NSURL *) composeQueryParameters :(NSDictionary *)dict
{
	NSURLComponents *components=[NSURLComponents componentsWithString:@""];
	NSMutableArray *parameters=[[NSMutableArray alloc]init];
	for(NSString *key in dict)
	{
		//each object of parameters array is of the type NSURLQueryItem
		[parameters addObject:[NSURLQueryItem queryItemWithName:key value:[dict valueForKey:key]]];
	}
	components.queryItems=parameters;
	NSURL *url=components.URL;
	return url;
	
}


//method joins all the URL components
+(NSString *) composeURLString :(NSDictionary *)dict withResource :(NSString *)resource
{
	NSURL *urlQueryParameters=[ComposeURL composeQueryParameters:dict];
	
	//converting NSURL to NSString
	NSString *urlQueryParameterStr=urlQueryParameters.absoluteString;
	
	//joining all the components of URL
	NSString *urlString=[NSString stringWithFormat:@"%@%@%@%@%@",KZOMATO_URL_HOST,KZOMATO_API,KZOMATO_VERSION,resource,urlQueryParameterStr];
	
	return urlString;
}


@end
