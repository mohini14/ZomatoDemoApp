//
//  StringOperations.h
//  ZomatoDempApp
//
//  Created by Mohini on 08/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"

@interface StringOperations : NSString
+(NSURL *) composeURL :(NSURL *) queryParameters withResource :(NSString *)resource;
+(BOOL) isInteger :(NSObject *)obj;


@end
