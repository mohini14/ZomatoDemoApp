//
//  parser.m
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "DataParser.h"

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



+(void) getLocation :(double)lat withLongitude :(double)lon withCompletionHandler :(void (^)(CityDetails *city,NSString *errorMsg))callBackToMainVC{
    //NSURL *url=[DataParser composeURLWithParametersForLOCATION :lat withLongitude :(double) lon];
	__block NSURLRequest *request;
		//NSString *urlString=url.absoluteString;
	NSString *urlParameters=[NSString stringWithFormat:KZOMATO_QUERY_PARAMETRE_LOCATION,lat,lon];
	NSString *urlString=[NSString stringWithFormat:@"%@%@%@%@%@",KZOMATO_URL_HOST,KZOMATO_API,KZOMATO_VERSION,@"cities",urlParameters];
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
//    NSDictionary *dict=@{ @"city"  : citySearch,
//                          @"count":[NSNumber numberWithInt:10]
//};
	///NSURL *url=[DataParser composeQueryParameters:dict];
   // NSURL *composedURL=[StringOperations composeURL:url withResource:@"cities"];
	//NSString *urlString=composedURL.absoluteString;
	//NSString *urlString=[StringOperations composeURL:dict withResource:@"cities"];
	NSString *urlParameter =[NSString stringWithFormat:KZOMATO_QUERY_PARAMETER_CITIES,citySearch,10];
	NSString *urlString=[NSString stringWithFormat:@"%@%@%@%@%@",KZOMATO_URL_HOST,KZOMATO_API,KZOMATO_VERSION,@"cities",urlParameter];
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
//+(NSURL *) composeQueryParameters :(NSDictionary *)dict
//{
//	NSURLComponents *components=[NSURLComponents componentsWithString:@""];
//    NSMutableArray *parameters=[[NSMutableArray alloc]init];
//    for(NSString *obj in dict)
//    {
//		NSString *val;
//		NSLog(@"key..=%@,value...=%@",obj,[dict objectForKey:obj]);
//		if([StringOperations isInteger:[dict valueForKey:obj]] )
//		{
//			val=[[dict valueForKey:obj]stringValue];
//		}
//		else
//		{
//			val=[dict valueForKey:obj];
//		}
//        [parameters addObject:[NSURLQueryItem queryItemWithName:obj value:val]];
//    }
//    
//    components.queryItems=parameters;
//	NSURL *url=components.URL;
//	return url;
//   // NSURLComponents *components = [NSURLComponents componentsWithString:@"http://stackoverflow.com"];
////    NSURLQueryItem *search = [NSURLQueryItem queryItemWithName:@"q" value:@"ios"];
////    NSURLQueryItem *count = [NSURLQueryItem queryItemWithName:@"count" value:@"10"];
////    components.queryItems = @[ search, count ];
////    NSURL *url = components.URL; // h
////	
//}



@end
