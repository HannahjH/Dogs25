//
//  HJHBreed.h
//  Dogs25
//
//  Created by Hannah Hoff on 3/27/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HJHBreed : NSObject

@property (nonatomic, copy, readonly)NSString *name;
@property (nonatomic, copy, readonly)NSArray<HJHBreed *> *subBreeds;
@property (nonatomic, copy, readonly)NSArray<NSString *> *imageUrl;

-(instancetype)initWithName:(NSString *)name subBreeds:(NSArray <HJHBreed *> *)subBreeds imageUrl:(NSArray <NSString *> *)imageUrl;


@end

NS_ASSUME_NONNULL_END
