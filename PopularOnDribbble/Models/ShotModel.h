//
//  ShotModel.h
//  PopularOnDribbble
//
//  Created by Ryniere dos Santos Silva on 8/5/15.
//  Copyright (c) 2015 Ryniere dos Santos Silva. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>
#import "Player.h"

@interface ShotModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *shotDescription;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *imageTeaserUrl;
@property (nonatomic) int viewsCount;
@property (nonatomic, copy) Player *player;

@end
