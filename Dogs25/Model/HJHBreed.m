//
//  HJHBreed.m
//  Dogs25
//
//  Created by Hannah Hoff on 3/27/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import "HJHBreed.h"

@implementation HJHBreed

-(instancetype)initWithName:(NSString *)name subBreeds:(NSArray<HJHBreed *> *)subBreeds imageUrl:(NSArray<NSString *> *)imageUrl
{
    self = [super init];
    if(self) {
        _name = name;
        _subBreeds = subBreeds;
        _imageUrl = imageUrl;
    }
    return self;

}

@end
