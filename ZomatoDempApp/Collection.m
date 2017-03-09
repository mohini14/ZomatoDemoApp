//
//  Collection.m
//  ZomatoDempApp
//
//  Created by Mohini on 09/03/17.
//  Copyright © 2017 Mohini. All rights reserved.
//

#import "Collection.h"

@implementation Collection

-(instancetype) initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self && dictionary){
        
        self.collectionId=[dictionary[KZOMATO_COLLECTION_COLLECTION_ID][KZOMATO_COLLECTIONS_ID]integerValue];
        self.url=dictionary[KZOMATO_COLLECTION_COLLECTION_ID][KZOMATO_COLLECTIONS_URL];
        self.dscription=dictionary[KZOMATO_COLLECTION_COLLECTION_ID][KZOMATO_COLLECTIONS_DESCRIPTION];
        self.imageUrl=dictionary[KZOMATO_COLLECTION_COLLECTION_ID][KZOMATO_COLLECTIONS_IMAGEURL];
        self.title=dictionary[KZOMATO_COLLECTION_COLLECTION_ID][KZOMATO_COLLECTIONS_TITLE];
        [self getImage:^(UIImage *image) {
            self.collectionImage=image;
        }];
       return self;
    }
    
    return nil;
}


//method to get image from Cached Data
-(void) getImage :(void (^)(UIImage * image))callBack{
    
    [[CacheManager getInstance]imageForURL:self.imageUrl withCompletionHandler:^(UIImage *image) {
        callBack(image);
    }];
    
}


@end



