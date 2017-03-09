//
//  ComposeURL.h
//  ZomatoDempApp
//
//  Created by Mohini Sindhu  on 09/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"

@interface ComposeURL : NSObject

+(NSString *) composeURLString :(NSDictionary *)dict withResource :(NSString *)resource;


@end
