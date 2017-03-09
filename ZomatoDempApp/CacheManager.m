//
//  CacheManager.m
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 02/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "CacheManager.h"

@implementation CacheManager

//Get an Instance of Cache Manager Class
+(instancetype) getInstance{
    static dispatch_once_t once;
    static CacheManager *sinstance=nil;
    if(sinstance==nil){
        dispatch_once(&once, ^{
            sinstance = [[CacheManager alloc]init];
        });
    }
    return sinstance;
}



//Check if the image is present in Cache Manager or not
-(void) imageForURL :(NSString *)imageURL withCompletionHandler:(void (^) (UIImage *))CallBackToMainVC{
    CacheManager *imgCached=[CacheManager getInstance];
    UIImage *img=[imgCached loadImageForURL:imageURL];
    if(img){
        CallBackToMainVC(img);
    }else{
        [imgCached downloadImageForURL:imageURL withCompletionHandler :^(UIImage *imageDownloaded){
            CallBackToMainVC(imageDownloaded);
        }];
    }
}



//DownLoad Image For the Very First Time
-(void) downloadImageForURL :(NSString *)imageURL withCompletionHandler:(void (^) (UIImage *downloadedImage))callBack
{
    NSURL *imageNSURL=[NSURL URLWithString:imageURL];
    
    NSURLSessionConfiguration *sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    NSURLSessionDownloadTask *downloadTask=[session downloadTaskWithURL:imageNSURL completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                            {
                                                NSData *data=[NSData dataWithContentsOfURL:location];
                                                UIImage *downloadedImage=[UIImage imageWithData:data];
                                                [self saveDownloadedImage:downloadedImage withURL:imageNSURL];//saving downloaded Image
                                                
                                                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                                    callBack(downloadedImage);
                                                }];
                                                
                                            }];
    
    [downloadTask resume];
    
}

//Save image when Downloaded
-(void) saveDownloadedImage :(UIImage *)image withURL:imageURL{
    if(image !=nil)
    {
        //retrieving path and corresponding name of file
        NSString *pathToSaveImages=[self retrievePathForNameInDocumentDirectory :[imageURL lastPathComponent]];
        NSData *imageData=UIImagePNGRepresentation(image);
        [imageData writeToFile:pathToSaveImages atomically:NO];
    }
}

// Retreving image from cache manager for given "PATH" in Documnet Directory for given "NAME"
-(UIImage *)loadImageForURL :(NSString *)imgURL
{
    UIImage *image=[UIImage imageWithContentsOfFile:[self retrievePathForNameInDocumentDirectory :[imgURL lastPathComponent]]];//loading image if already present
    return image;
}


//Retrieve path For given NAME
-(NSString *)  retrievePathForNameInDocumentDirectory :(NSString *)fileName
{
    NSArray   *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString  *docDirectory = [paths    objectAtIndex:0];
    NSString  *imagePath = [docDirectory   stringByAppendingPathComponent:fileName];
    return imagePath;
    
}













@end
