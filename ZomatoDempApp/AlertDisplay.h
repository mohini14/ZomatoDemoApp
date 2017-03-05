//
//  AlertDisplay.h
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> 
#import "Define.h"
#define ALERT_TITLE_OK @"OK"

@interface AlertDisplay : NSObject

+ (void)showAlertPopupWithTitle:(NSString *)message forView:(UIViewController *)view ;


@end
