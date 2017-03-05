//
//  parser.m
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "parser.h"

@implementation parser

+(void) getCategories :(void (^)(NSArray *categories,NSString * errorMsg))callBackToMainVC
{
    __block NSURLRequest *request;
    
    [Services makeRequest:ZOMATO_CATEGORY_FIELD withData:nil withCompletionHandler:^(NSURLRequest *recievedRequest)
    {
        request=recievedRequest;
    }];
    [Services sendRequest:request completionHandler:^(NSData *data, NSString *errorMsg)
     {
        NSDictionary *responseDict=nil;
        NSError *err=nil;
         NSMutableArray *categories=[[NSMutableArray alloc]init];
        responseDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&err];
        if(err!=nil)
        {
            errorMsg=ERROR_MSG;
        }
         else
         {
             for(NSDictionary *obj in responseDict[@"categories"])
             {
                 Category *category = [[Category alloc] initWithDictionary:obj];
                 [categories addObject:category];
                 
             }
             
             
         }
         callBackToMainVC(categories,errorMsg);
    }];
}



@end
