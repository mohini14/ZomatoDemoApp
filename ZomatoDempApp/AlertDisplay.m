//
//  AlertDisplay.m
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "AlertDisplay.h"

@implementation AlertDisplay


+ (void)showAlertPopupWithTitle:(NSString *)message forView:(UIViewController *)view {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(APP_NAME_CONSTANT, nil) message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:NSLocalizedString(ALERT_TITLE_OK, nil) style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    [view presentViewController:alertController animated:YES completion:nil];
}

@end
