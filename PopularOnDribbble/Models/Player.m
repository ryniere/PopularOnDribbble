//
//  Player.m
//  PopularOnDribbble
//
//  Created by Ryniere dos Santos Silva on 8/8/15.
//  Copyright (c) 2015 Ryniere dos Santos Silva. All rights reserved.
//

#import "Player.h"

@implementation Player

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name": @"name",
             @"avatarUrl": @"avatar_url"
             };
}

@end
