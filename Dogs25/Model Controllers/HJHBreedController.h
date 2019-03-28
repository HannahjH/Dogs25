//
//  HJHBreedController.h
//  Dogs25
//
//  Created by Hannah Hoff on 3/27/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJHBreed.h"
#import "HJHSubBreed.h"

NS_ASSUME_NONNULL_BEGIN

@interface HJHBreedController : NSObject

+(void)fetchAllBreed:(void(^)(NSArray<HJHBreed *> *breeds))completion;
+(void)fetchBreedImageUrls:(HJHBreed *)breed completion:(void(^)(NSArray<NSString *> *imageUrl))completion;
+(void)fetchSubBreedImageUrls:(HJHBreed *)breed subBreed:(HJHSubBreed *)subBreed completion:(void(^)(NSArray<NSString *> *imageUrl))completion;
+(void)fetchImageData:(NSURL *)url completion:(void(^)(NSData *imageData))completion;

+(HJHBreedController *)shared;


@end

NS_ASSUME_NONNULL_END
