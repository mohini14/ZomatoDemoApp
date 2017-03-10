//
//  Collection.h
//  ZomatoDempApp
//
//  Created by Mohini on 09/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CacheManager.h"

#define KZOMATO_COLLECTIONS_ID @"collection_id"
#define KZOMATO_COLLECTIONS_URL @"url"
#define KZOMATO_COLLECTIONS_TITLE @"title"
#define KZOMATO_COLLECTIONS_DESCRIPTION @"description"
#define KZOMATO_COLLECTIONS_IMAGEURL @"image_url"
#define KZOMATO_COLLECTION_COLLECTION_ID @"collection"


@interface Collection : NSObject

@property NSInteger collectionId;
@property NSString *url;
@property NSString *dscription;
@property NSString *imageUrl;
@property NSString *title;
@property UIImage *collectionImage;

-(instancetype) initWithDictionary:(NSDictionary*)dictionary;

@end
