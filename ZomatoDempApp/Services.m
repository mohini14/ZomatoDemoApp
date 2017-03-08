//
//  Services.m
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "Services.h"

@implementation Services


+(void) makeRequest :(NSString *)urlString  withCompletionHandler :(void (^)(NSURLRequest *request))callBackToParser{
    NSURL *url=[NSURL URLWithString:urlString];
    NSLog(@"URL String=%@",url.description);
    NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setValue:ZOMATO_API_KEY forHTTPHeaderField:@"user-Key"];//sending API KEY with  Authorization Header
    callBackToParser(urlRequest);

}


+ (void) sendRequest:(NSURLRequest *) request completionHandler:(void (^) (NSDictionary *,NSString *))callbackToParser
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
		{
        NSLog(@" data:%@, response:%@, error:%@", data.description, response.description, error.description);
		
		NSString *errorMsg=nil;
        NSDictionary *responseData=nil;
		NSError *err=nil;
		
        if(error!=nil)
		{
            errorMsg=SERVER_ERROR;//if server erro ,status code==5XX
        }
		else
		{
			responseData=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&err];if(err!=nil)
			{
				errorMsg=err.description;//if data is not parsable
			}
        }
        dispatch_async(dispatch_get_main_queue(), ^
			{
            callbackToParser(responseData,errorMsg);
            });
    }];
    [dataTask resume];
}


//+(void) makeRequestWithParametres :(NSString *)urlString withService :(NSString *)service withCompletionHandler:(void (^)(NSURLRequest *request))callBackToParser
//{
//	//NSString * urlStr =[urlString stringByReplacingOccurrencesOfString:@"<service>" withString:service];
//	// urlString=[urlString stringByAppendingString:data];
//	NSURL *url=[NSURL URLWithString:urlString];
//	NSLog(@"URL String=%@",url.description);
//	NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
//	[urlRequest setHTTPMethod:@"GET"];
//	[urlRequest setValue:ZOMATO_API_KEY forHTTPHeaderField:@"user-Key"];//sending API KEY with  Authorization Header
//	callBackToParser(urlRequest);
//}

@end

