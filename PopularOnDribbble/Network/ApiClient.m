//
//  ApiClient.m
//  PopularOnDribbble
//
//  Created by Ryniere dos Santos Silva on 8/5/15.
//  Copyright (c) 2015 Ryniere dos Santos Silva. All rights reserved.
//

#import "ApiClient.h"

static NSString *const kPopularShotsListPath = @"/shots/popular?page=%@";

@implementation ApiClient

- (NSURLSessionDataTask *)getPopularShotsFromPage:(NSString *)page success:(void (^)(ShotListModel *shotList))success failure:(void (^)(NSError *error))failure{
    
    return [self GET: [NSString stringWithFormat:kPopularShotsListPath, page] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSDictionary *responseDictionary = (NSDictionary *)responseObject;
        
        NSError *error;
        ShotListModel *shotList = [MTLJSONAdapter modelOfClass:ShotListModel.class
                                            fromJSONDictionary:responseDictionary error:&error];
        success(shotList);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        failure(error);
        
    }];
}

@end
