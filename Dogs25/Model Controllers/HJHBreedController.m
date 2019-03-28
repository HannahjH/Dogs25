//
//  HJHBreedController.m
//  Dogs25
//
//  Created by Hannah Hoff on 3/27/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import "HJHBreedController.h"

@implementation HJHBreedController

+(NSURL *)baseUrl {
    return [NSURL URLWithString:@"https://dog.ceo/api"];
    
}

+(void)fetchAllBreed:(void (^)(NSArray<HJHBreed *> * _Nonnull))completion
{
    
    NSURL *url = [[[[HJHBreedController baseUrl] URLByAppendingPathComponent:@"breeds"] URLByAppendingPathComponent:@"list"] URLByAppendingPathComponent:@"all"];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error %@", error);
            completion(@[]);
            return;
        }
        
        if (!data){
            NSLog(@"We got an error dealing with out data");
            completion(@[]);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *messageDictionary = jsonDictionary[@"message"];
        
        NSMutableArray *breeds = [NSMutableArray new];
        
        for(NSString *key in messageDictionary){
            for (NSArray *value in messageDictionary){
                HJHBreed *breed = [[HJHBreed alloc] initWithName:key subBreeds:value imageUrl:[NSMutableArray new]];
                [breeds addObject:breed];
            }
        }
        completion(breeds);
    }]resume];
     }

+(void)fetchBreedImageUrls:(HJHBreed *)breed completion:(void(^)(NSArray<NSString *> *imageUrl))completion;
{
    NSURL *url = [[[HJHBreedController baseUrl] URLByAppendingPathComponent:breed.name] URLByAppendingPathComponent:@"images"];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error %@", error);
            completion(nil);
            return;
        }
        if (!data) {
            NSLog(@"WE got an error dealing with our image data");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *messageArray = jsonDictionary[@"message"];
        
        completion(messageArray);
        return;
    }]resume];
}

     +(void)fetchSubBreedImageUrls:(HJHBreed *)breed subBreed:(HJHSubBreed *)subBreed completion:(void(^)(NSArray<NSString *> *imageUrl))completion
     {
         NSURL *url = [[[HJHBreedController baseUrl] URLByAppendingPathComponent:subBreed.subBreedName] URLByAppendingPathComponent:@"images"];
         [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
             if (error) {
                 NSLog(@"There was an error %@", error);
                 completion(nil);
                 return;
             }
             if (!data) {
                 NSLog(@"WE got an error dealing with our image data");
                 completion(nil);
                 return;
             }
             
             NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
             NSArray *messageArray = jsonDictionary[@"message"];
             
             completion(messageArray);
             return;
         }]resume];
     }

     +(void)fetchImageData:(NSURL *)url completion:(void (^)(NSData *imageData))completion
     {
         [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
             if (error) {
                 NSLog(@"There was an error %@", error);
                 completion(nil);
                 return;
             }
             if(!data) {
                 NSLog(@"Error fetching breeds DATA from searchTerm: %@", error);
                 completion(nil);
                 return;
             }
             completion(nil);
         }]resume];
     }
     
     + (HJHBreedController *)shared
     {
         static HJHBreedController *shared = nil;
         static dispatch_once_t onceToken;
         dispatch_once(&onceToken, ^{
             shared = [[ HJHBreedController alloc] init];
             
         });
         return shared;
     }
     
     @end
