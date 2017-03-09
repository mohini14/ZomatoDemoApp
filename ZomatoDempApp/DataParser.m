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

//method gets current location of user
+(void) getLocation :(double)lat withLongitude :(double)lon withCompletionHandler :(void (^)(CityDetails *city,NSString *errorMsg))callBackToMainVC
{
    __block NSURLRequest *request;
	NSNumber *latitude=[NSNumber numberWithDouble:lat];//converting double to an object type
	NSNumber *longitude=[NSNumber numberWithDouble:lon];//converting double to an object type
	
	NSDictionary *dict=@{@"lat":[@"" add:latitude], //initialising a dictionary to make query parameter
                        @"lon":[@"" add:longitude]};
	
	//method gets composed urlString
    NSString *urlString=[ComposeURL composeURLString:dict withResource:KZOMATO_CITY_RESOURCE];
	
	//method makes request to server to establish connection
	[Services makeRequest:urlString withCompletionHandler:^(NSURLRequest *recievedRequest)
	{
		request=recievedRequest;
		
		//sending request to server to get data
		[Services sendRequest:request completionHandler:^(NSDictionary *data, NSString *errorMsg)
		 {
			 CityDetails *currentCity;
			 if(errorMsg==nil)
			 {
				 //converting recieved data to CityDetails model
				 NSArray *array= data[KZOMATO_LOCATION_SUGGESTION_KEY];
				 CityDetails *city=[[CityDetails alloc]initWithDictionary:array[0]];
				 currentCity=city;
			 }
			 callBackToMainVC(currentCity,errorMsg);
	}];
	}];
}


// method gets the details of a city
+(void) getCityDetails :(NSString *)citySearch withCompletionHandler :(void (^) (NSArray * cityDetails ,NSString * errorMsg))callBackToMainVC
{
	__block NSURLRequest *request;
    NSNumber *count =KZOMATO_LIMIT_FETCHED_RESULTS ;           //converting an integer to object type
    NSDictionary *dict=@{ @"q"  : citySearch,
                          @"count":[@"" add:count]}; //initialising dict to make query parameters
	//method get composed URL string
    NSString *urlString=[ComposeURL composeURLString:dict withResource:KZOMATO_CITY_RESOURCE];
	
	//method makes request to server to establish connection
    [Services makeRequest:urlString withCompletionHandler:^(NSURLRequest *recievedRequest)
	 {
		request=recievedRequest;
		//sending request to server to get data
		[Services sendRequest:request completionHandler:^(NSDictionary *data, NSString *errorMsg)
	   {
		 NSMutableArray *cityDetails=[[NSMutableArray alloc]init];
		 if(errorMsg==nil)
		 {
			 NSArray *array = data[KZOMATO_LOCATION_SUGGESTION_KEY];//location suggestion is an array
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


//method gets the collections in a city i.e groups of resturant types in a city
+(void) getCollections:(double)lat withLongitude:(double)lon withCompletionHandler :(void (^) (NSArray *array,NSString *errorMsg))callBackToMainVC
{
    __block NSURLRequest *request;
    NSNumber *latitude=[NSNumber numberWithDouble:lat];
    NSNumber *longitude=[NSNumber numberWithDouble:lon];
    NSNumber *count=KZOMATO_LIMIT_FETCHED_RESULTS;    //converting an integer to object type
	SessionData *session=[SessionData getInstance];
	NSNumber *city_id=session.currentCityDetails.city_id;
    NSDictionary *dict=@{@"lat":[@"" add:latitude],
						 @"lon":[@"" add:longitude],//initialising dict to make query parameters
						 @"count":[@"" add:count],
						 @"city_id":[@"" add:city_id]
                         };
	
	//method get composed URL string
	NSString *urlString=[ComposeURL composeURLString:dict withResource:KZOMATO_COLLECTIONS_RESOURSE];
	//method makes request to server to establish connection
    [Services makeRequest:urlString withCompletionHandler:^(NSURLRequest *recievedRequest)
     {
         request=recievedRequest;
		 //sending request to server to get data
         [Services sendRequest:request completionHandler:^(NSDictionary *data, NSString *errorMsg)
          {
              NSMutableArray *cityCollections=[[NSMutableArray alloc]init];
              if(errorMsg==nil)
              {
				   NSArray *array = data[KZOMATO_COLLECTIONS_RESOURSE];
				  for(NSDictionary *obj in array)
				  {
					  //converting data to collection model class
					  Collection *collection=[[Collection alloc]initWithDictionary:obj];
					  [cityCollections addObject:collection];
				  }
					  
              }
              callBackToMainVC(cityCollections,errorMsg);
          }];
     }];
    
}

//method gets all the resturants in the given city on the basis of city name,lat,lon
+(void) getAllResturants :(void (^) (NSArray *array,NSString *errorMsg))callBackToMAinVC
{
	__block NSURLRequest *request;
	SessionData *session=[SessionData getInstance];
	NSNumber *latitude=[NSNumber numberWithDouble:session.lat];
	NSNumber *longitude=[NSNumber numberWithDouble:session.lon];
	NSNumber *count=KZOMATO_LIMIT_FETCHED_RESULTS;   //converting an integer to object type
	NSNumber *radius=KZOMATO_FIXED_RADIUS;
	NSDictionary *dict=@{@"lat":[@"" add:latitude],
						 @"lon":[@"" add:longitude],//initialising dict to make query parameters
						 @"count":[@"" add:count],
						 @"radius":[@"" add:radius],
						 @"q" :session.currentCityDetails.name,
                         @"order":@"asc",
                         @"sort":@"rating",
                         @"entity_type":@"city"
						 };
	//method get composed URL string
	NSString *urlString=[ComposeURL composeURLString:dict withResource:KZOMATO_SEARCH_RESOURSE];
	//method makes request to server to establish connection
	[Services makeRequest:urlString withCompletionHandler:^(NSURLRequest *recievedRequest)
	 {
		 request=recievedRequest;
		 //sending request to server to get data
		 [Services sendRequest:request completionHandler:^(NSDictionary *data, NSString *errorMsg)
		  {
			  NSMutableArray *resturants=[[NSMutableArray alloc]init];
			  if(errorMsg==nil)
			  {
				  NSArray *array = data[KZOMATO_RESTURANTS_KEY];
				  for(NSDictionary *obj in array)
				  {
					  Resturant *resturant=[[Resturant alloc]initWithDictionary:obj];
					  [resturants addObject:resturant];
				  }
				  
			  }
			  callBackToMAinVC(resturants,errorMsg);
		  }];
	 }];

}

@end
