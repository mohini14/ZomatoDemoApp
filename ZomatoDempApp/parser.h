//
//  parser.h
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"
#import "Services.h"
#import "Category.h"

@interface parser : NSObject

+(void) getCategories :(void (^)(NSArray *categories,NSString * errorMsg))callBackToMainVC;


@end
