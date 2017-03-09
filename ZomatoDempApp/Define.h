//
//  Define.h
//  ZomatoDempApp
//
//  Created by Mohini on 05/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KZOMATO_URL_HOST @"https://developers.zomato.com/"
#define KZOMATO_API @"api/"
#define KZOMATO_VERSION @"v2.1/"
#define KZOMATO_API_KEY @"eca1d4a6765f00203615bcc044ff371a"
#define KZOMATO_CATEGORY_FIELD @"categories"
#define KZOMATO_CITYDETAILS_FIELD @"cities"
#define KZOMATO_QUERY_PARAMETER_CITIES @"?q=%@&count=%d"
#define KZOMATO_QUERY_PARAMETRE_LOCATION @"?lat=%f&lon=%f"

#define KAPP_NAME_CONSTANT @"ZOMATO"

#define KSERVER_ERROR @"SERVER ERROR"
#define KERROR_MSG @"SOMETHING WENT WRONG"
#define KDATA_FETCHING_ERROR_MESSAGE @"ERROR IN FETCHING DATA"

#define KZERO_INT_CONST 0

@interface Define : NSObject

@end
