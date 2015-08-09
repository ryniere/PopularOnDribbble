//
//  SessionManager.h
//  PopularOnDribbble
//
//  Created by Ryniere dos Santos Silva on 8/5/15.
//  Copyright (c) 2015 Ryniere dos Santos Silva. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface SessionManager : AFHTTPSessionManager

+ (id)sharedManager;

@end
