//
//  ShotModel.m
//  PopularOnDribbble
//
//  Created by Ryniere dos Santos Silva on 8/5/15.
//  Copyright (c) 2015 Ryniere dos Santos Silva. All rights reserved.
//

#import "ShotModel.h"

@implementation ShotModel

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"title": @"title",
             @"shotDescription": @"description",
             @"imageUrl": @"image_url",
             @"imageTeaserUrl": @"image_teaser_url",
             @"viewsCount": @"views_count",
             @"player": @"player"
             };
}

+ (NSValueTransformer *)playerJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Player class]];
}

@end
