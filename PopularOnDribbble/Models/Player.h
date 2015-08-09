//
//  Player.h
//  PopularOnDribbble
//
//  Created by Ryniere dos Santos Silva on 8/8/15.
//  Copyright (c) 2015 Ryniere dos Santos Silva. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface Player : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *avatarUrl;

@end
