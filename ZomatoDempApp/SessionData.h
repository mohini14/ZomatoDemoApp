//
//  SessionData.h
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 06/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SessionData : NSObject

@property (strong,nonatomic) NSArray *currentCityDetails;
@property (strong,nonatomic) NSString *currentSelectedLocationButtonTitle;


+(instancetype)getInstance;



@end
