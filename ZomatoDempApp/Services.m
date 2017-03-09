//
//  Services.m
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "Services.h"

@implementation Services

//method makes request to be send to server
+(void) makeRequest :(NSString *)urlString  withCompletionHandler :(void (^)(NSURLRequest *request))callBackToParser{
    NSURL *url=[NSURL URLWithString:urlString];
	
    NSLog(@"URL String=%@",url.description);
	
    NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:K_REQUEST_GET_TYPE]; // request type==GET
    [urlRequest setValue:KZOMATO_API_KEY forHTTPHeaderField:K_USERKEY_KEY];//sending API KEY with  Authorization Header
    callBackToParser(urlRequest);

}


//method sends request to server and recieves data
+ (void) sendRequest:(NSURLRequest *) request completionHandler:(void (^) (NSDictionary *,NSString *))callbackToParser
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
		{
		NSString *errorMsg=nil;
        NSDictionary *responseData=nil;
		NSError *err=nil;
		if(error!=nil)
		{
            errorMsg=KSERVER_ERROR;//if server erro ,status code==5XX
        }
		else
		{
			responseData=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&err];if(err!=nil)
			{
				errorMsg=err.description;//if data is not parsable
			}
        }
		// working on main thread as the data needs to interact with UI elements
        dispatch_async(dispatch_get_main_queue(), ^{
            callbackToParser(responseData,errorMsg);
            });
    }];
    [dataTask resume];
}




@end

