//
//  NSString+StringOperations.m
//  ZomatoDempApp
//
//  Created by Mohini on 09/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "NSString+StringOperations.h"

@implementation NSString (StringOperations)

-(NSString *) add :(NSObject *)obj
{
   return  [NSString stringWithFormat:@"%@%@",self,obj];
    
}

@end
