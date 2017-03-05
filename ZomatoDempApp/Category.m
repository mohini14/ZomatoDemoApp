//
//  Category.m
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "Category.h"

@implementation Category

-(instancetype) initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self && dictionary){
        self.id=[dictionary[CATEGORY_ID][CATEGORY_ID_KEY ]integerValue];
        self.name=dictionary[CATEGORY_ID][CATEGORY_NAME_KEY];
        return self;
    }
    return nil;
    
}


@end
