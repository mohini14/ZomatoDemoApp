//
//  CacheManager.h
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 02/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Define.h"
#import "AlertDisplay.h"

@interface CacheManager : NSObject

-(void) imageForURL :(NSString *)imageURL withCompletionHandler:(void (^) (UIImage *))callBackToMainVC;

@end
