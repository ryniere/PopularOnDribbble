//
//  ApiClient.h
//  PopularOnDribbble
//
//  Created by Ryniere dos Santos Silva on 8/5/15.
//  Copyright (c) 2015 Ryniere dos Santos Silva. All rights reserved.
//

#import "SessionManager.h"
#import "ShotListModel.h"

@interface ApiClient : SessionManager

- (NSURLSessionDataTask *)getPopularShotsFromPage:(NSString *)page success:(void (^)(ShotListModel *shotList))success failure:(void (^)(NSError *error))failure;

@end
