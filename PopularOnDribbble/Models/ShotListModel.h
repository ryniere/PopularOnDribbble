//
//  ShotListModel.h
//  PopularOnDribbble
//
//  Created by Ryniere dos Santos Silva on 8/5/15.
//  Copyright (c) 2015 Ryniere dos Santos Silva. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>
#import "ShotModel.h"

@interface ShotListModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSArray *shots;
@property (nonatomic, copy) NSString *page;
@property (nonatomic) int perPage;
@property (nonatomic) int pages;
@property (nonatomic) int total;

@end
