//
//  Category.h
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#define CATEGORY_ID_KEY  @"id"
#define CATEGORY_NAME_KEY @"name"
#define CATEGORY_ID @"categories"

@interface Category : NSObject

@property NSInteger id;
@property NSString *name;

-(instancetype) initWithDictionary:(NSDictionary*)dictionary;


@end
