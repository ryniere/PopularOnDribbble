//
//  ShotListModel.m
//  PopularOnDribbble
//
//  Created by Ryniere dos Santos Silva on 8/5/15.
//  Copyright (c) 2015 Ryniere dos Santos Silva. All rights reserved.
//

#import "ShotListModel.h"

@implementation ShotListModel

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"shots" : @"shots",
             @"page" : @"page",
             @"perPage" : @"per_page",
             @"pages" : @"pages",
             @"total" : @"total"
             };
}

#pragma mark - JSON Transformer

+ (NSValueTransformer *)shotsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:ShotModel.class];
}

@end
