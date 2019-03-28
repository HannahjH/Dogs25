//
//  HJHSubBreed.m
//  Dogs25
//
//  Created by Hannah Hoff on 3/27/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import "HJHSubBreed.h"

@implementation HJHSubBreed

-(instancetype)initWithsubBreedName:(NSString *)subBreedName imageUrl:(NSArray<NSString *> *)imageUrl
{
    self = [super init];
    if(self){
    _subBreedName = subBreedName;
    _imageUrl = imageUrl;
}
    return self;
}


@end
