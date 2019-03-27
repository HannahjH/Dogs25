//
//  HJHSubBreed.h
//  Dogs25
//
//  Created by Hannah Hoff on 3/27/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HJHSubBreed : NSObject

@property (nonatomic, copy, readonly)NSString *subBreedName;
@property (nonatomic, copy, readonly)NSArray<NSString *> *imageUrl;

-(instancetype)initWithsubBreedName:(NSString *)subBreedName imageUrl:(NSArray<NSString *> *)imageUrl;

@end

NS_ASSUME_NONNULL_END
