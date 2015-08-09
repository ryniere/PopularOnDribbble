//
//  ApiClientTestCase.m
//  PopularOnDribbble
//
//  Created by Ryniere dos Santos Silva on 8/8/15.
//  Copyright (c) 2015 Ryniere dos Santos Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ApiClient.h"

@interface ApiClientTestCase : XCTestCase

@end

@implementation ApiClientTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testPopularShots{
    // This is an example of a functional test case.
    
    [self testPopularShotsFromPage:@"1"];
    [self testPopularShotsFromPage:@"2"];
    [self testPopularShotsFromPage:@"3"];
    [self testPopularShotsFromPage:@"4"];
    [self testPopularShotsFromPage:@"5"];
    [self testPopularShotsFromPage:@"6"];
}

- (void)testPopularShotsFromPage:(NSString *)page{
    // This is an example of a functional test case.

   XCTestExpectation *expectation = [self expectationWithDescription:page];
    
    [[ApiClient sharedManager] getPopularShotsFromPage:page success:^(ShotListModel *shotList) {
        
        XCTAssertEqualObjects(page, shotList.page,@"Pass");
        [expectation fulfill];
        
        
    } failure:^(NSError *error) {
        
        XCTAssert(true, @"Failed");
        
    }];
    
    [self waitForExpectationsWithTimeout:15.0 handler:^(NSError *error) {
        
    }];
    
}

@end
