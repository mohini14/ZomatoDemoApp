//
//  SessionData.m
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 06/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "SessionData.h"

@implementation SessionData

+(instancetype)getInstance {
	static SessionData *sharedInstance=nil;
	if(sharedInstance!=nil){
		return sharedInstance;
	}else{
		@synchronized (self) {
			if(sharedInstance==nil){
				sharedInstance=[[SessionData alloc]init];
				
			}
		}
	}
	return sharedInstance;
}




@end
