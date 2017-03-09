//
//  parser.m
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "DataParser.h"
#import "NSString+StringOperations.h"

@implementation DataParser

//+(void) getCategories :(void (^)(NSArray *categories,NSString * errorMsg))callBackToMainVC
//{
//    __block NSURLRequest *request;
//    
//    [Services makeRequest:ZOMATO_CATEGORY_FIELD withData:nil withCompletionHandler:^(NSURLRequest *recievedRequest)
//    {
//        request=recievedRequest;
//    }];
//    [Services sendRequest:request completionHandler:^(NSDictionary *data, NSString *errorMsg)
//     {
//		NSMutableArray *categories=[[NSMutableArray alloc]init];
//		if(errorMsg==nil)
//		{
//		 for(NSDictionary *obj in data[@"categories"])
//             {
//                 Category *category = [[Category alloc] initWithDictionary:obj];
//                 [categories addObject:category];
//			 }
//		}
//         callBackToMainVC(categories,errorMsg);
//    }];
//}



//
//+(NSURL *) composeURLWithParametersForLOCATION :(double)lat withLongitude :(double)lon {
//		NSURLComponents *components=[NSURLComponents componentsWithString:ZOMATO_URL];
//        NSString *latitude=[NSString stringWithFormat:@"%.20f", lat];
//        NSString *longitude=[NSString stringWithFormat:@"%.20f", lon];
//        NSURLQueryItem *latd=[NSURLQueryItem queryItemWithName:@"lat" value:latitude];
//        NSURLQueryItem *lond=[NSURLQueryItem queryItemWithName:@"lon" value:longitude];
//		components.queryItems=@[latd,lond];
//		NSURL *url=components.URL;
//		return url;
//	
//	
//}

//+(void)getCurrentLocation:(double)lat withLongitude :(double)lon withCompletionHandler :(void (^)(CityDetails *city,NSString *errorMsg))callBackToMainVC
//{
//    __block NSURLRequest *request;
//    NSNumber *latitude=[NSNumber numberWithDouble:lat];
//    NSNumber *longitude=[NSNumber numberWithDouble:lon];
//    
//    NSDictionary *dict=@{@"lat":[@"" add:latitude],
//                         @"lon":[@"" add:longitude]
//                         };
//    NSString *urlString=[DataParser composeURLString:dict withResource:@"locations"];
//    
//    [Services makeRequest:urlString withCompletionHandler:^(NSURLRequest *recievedRequest)
//     {
//         request=recievedRequest;
//         __block Location *currentLocation;
//         [Services sendRequest:request completionHandler:^(NSDictionary *data, NSString *errorMsg)
//          {
//              // NSMutableArray *cityDetails=[[NSMutableArray alloc]init];
//              if(errorMsg==nil)
//              {
//                  NSArray *array= data[@"location_suggestions"];
//                  Location *location=[Location alloc]initWithDictionary:array[0]];
//                  currentLocation=location;
//              }
//              
//              callBackToMainVC(currentLocation,errorMsg);
//          }];
//     }];
//    
//
//}

+(void) getLocation :(double)lat withLongitude :(double)lon withCompletionHandler :(void (^)(CityDetails *city,NSString *errorMsg))callBackToMainVC{
    __block NSURLRequest *request;
    NSNumber *latitude=[NSNumber numberWithDouble:lat];
    NSNumber *longitude=[NSNumber numberWithDouble:lon];

    NSDictionary *dict=@{@"lat":[@"" add:latitude],
                        @"lon":[@"" add:longitude]
        };
    NSString *urlString=[DataParser composeURLString:dict withResource:@"cities"];
	
        [Services makeRequest:urlString withCompletionHandler:^(NSURLRequest *recievedRequest)
		 {
			request=recievedRequest;
             __block CityDetails *currentCity;
			[Services sendRequest:request completionHandler:^(NSDictionary *data, NSString *errorMsg)
		   {
			// NSMutableArray *cityDetails=[[NSMutableArray alloc]init];
			 if(errorMsg==nil)
			 {
				 NSArray *array= data[@"location_suggestions"];
                 CityDetails *city=[[CityDetails alloc]initWithDictionary:array[0]];
                 currentCity=city;
			 }
               
			 callBackToMainVC(currentCity,errorMsg);
		 }];
		}];

	
	
}



+(void) getCityDetails :(NSString *)citySearch withCompletionHandler :(void (^) (NSArray * cityDetails ,NSString * errorMsg))callBackToMainVC
{
	__block NSURLRequest *request;
    NSNumber *count = @10;
    NSDictionary *dict=@{ @"q"  : citySearch,
                          @"count":[@"" add:count]
                          };
    NSString *urlString=[DataParser composeURLString:dict withResource:@"cities"];
    [Services makeRequest:urlString withCompletionHandler:^(NSURLRequest *recievedRequest)
	 {
		request=recievedRequest;
		[Services sendRequest:request completionHandler:^(NSDictionary *data, NSString *errorMsg)
	   {
		 NSMutableArray *cityDetails=[[NSMutableArray alloc]init];
		 if(errorMsg==nil)
		 {
			 NSArray *array = data[@"location_suggestions"];//location suggestion is an array
			for(NSDictionary *obj in array)
			{
				CityDetails *cityDetail=[[CityDetails alloc]initWithDictionary:obj];
				[cityDetails addObject:cityDetail];
				
			}
			 
		 }
		 callBackToMainVC(cityDetails,errorMsg);
	 }];
	}];
}

+(void) getCollections:(double)lat withLongitude:(double)lon withCompletionHandler :(void (^) (NSArray *array,NSString *errorMsg))callBackToMainVC
{
    __block NSURLRequest *request;
    NSNumber *latitude=[NSNumber numberWithDouble:lat];
    NSNumber *longitude=[NSNumber numberWithDouble:lon];
    NSNumber *count=@10;
    
    NSDictionary *dict=@{@"lat":[@"" add:latitude],
                         @"lon":[@"" add:longitude],
                         @"count":[@"" add:count]
                         };
    NSString *urlString=[DataParser composeURLString:dict withResource:@"cities"];
    [Services makeRequest:urlString withCompletionHandler:^(NSURLRequest *recievedRequest)
     {
         request=recievedRequest;
         [Services sendRequest:request completionHandler:^(NSDictionary *data, NSString *errorMsg)
          {
              NSMutableArray *cityDetails=[[NSMutableArray alloc]init];
              if(errorMsg==nil)
              {
                  NSArray *array = data[@"location_suggestions"];//location suggestion is an array
                  for(NSDictionary *obj in array)
                  {
                      CityDetails *cityDetail=[[CityDetails alloc]initWithDictionary:obj];
                      [cityDetails addObject:cityDetail];
                      
                  }
                  
              }
              callBackToMainVC(cityDetails,errorMsg);
          }];
     }];
    
}
#pragma mark-Composing URL QUERY PARAMETRS 
+(NSURL *) composeQueryParameters :(NSDictionary *)dict
{
	NSURLComponents *components=[NSURLComponents componentsWithString:@""];
    NSMutableArray *parameters=[[NSMutableArray alloc]init];
    for(NSString *key in dict)
    {
        [parameters addObject:[NSURLQueryItem queryItemWithName:key value:[dict valueForKey:key]]];
    }
    
    components.queryItems=parameters;
	NSURL *url=components.URL;
	return url;
  
}

+(NSString *) composeURLString :(NSDictionary *)dict withResource :(NSString *)resource
{
    NSURL *urlQueryParameters=[DataParser composeQueryParameters:dict];
    NSString *urlQueryParameterStr=urlQueryParameters.absoluteString;
    NSString *urlString=[NSString stringWithFormat:@"%@%@%@%@%@",KZOMATO_URL_HOST,KZOMATO_API,KZOMATO_VERSION,resource,urlQueryParameterStr];
    return urlString;
}

@end
