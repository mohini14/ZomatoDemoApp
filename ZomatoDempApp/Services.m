//
//  Services.m
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "Services.h"

@implementation Services


+(void) makeRequest :(NSString *)service withData :(NSString *) data withCompletionHandler :(void (^)(NSURLRequest *request))callBackToParser{
    NSString * urlString =[ZOMATO_URL stringByAppendingString:service];
   // urlString=[urlString stringByAppendingString:data];
    NSURL *url=[NSURL URLWithString:urlString];
    NSLog(@"URL String=%@",url.description);
    NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setValue:ZOMATO_API_KEY forHTTPHeaderField:@"user-Key"];//sending API KEY with  Authorization Header
    callBackToParser(urlRequest);

}


+ (void) sendRequest:(NSURLRequest *) request completionHandler:(void (^) (NSData *,NSString *))callbackToParser
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@" data:%@, response:%@, error:%@", data.description, response.description, error.description);

        NSString *errorMsg=nil;
        NSData *responseData=nil;
        if(error!=nil){
            errorMsg=SERVER_ERROR;
        }else{
            responseData=data;
        }
        dispatch_async(dispatch_get_main_queue(), ^{ // ask sir about that do we need to do it again and again even if we dont need UI element and pass it as parameter.
            callbackToParser(responseData,errorMsg);
        });
    }];
    [dataTask resume];
}

@end

