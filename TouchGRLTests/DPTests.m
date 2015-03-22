//
//  DPTests.m
//  TouchGRL
//
//  Created by Mohamed El-Halawani on 2015-03-22.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DollarPoint.h"
#import "DollarPointCloud.h"
#import "DollarP.h"

@interface DPTests : XCTestCase

@end

@implementation DPTests

- (void)testRecognize {

    NSArray *pointsArray = [[NSArray alloc] initWithObjects:
        [[DollarPoint alloc] initWithId:@(1) x:30 y:7],
        [[DollarPoint alloc] initWithId:@(1) x:103 y:7],
    [[DollarPoint alloc] initWithId:@(2) x:66 y:7],
    [[DollarPoint alloc] initWithId:@(2) x:66 y:87],nil];

    NSMutableArray *templatesArray = [NSMutableArray array];
    templatesArray[0] = [[DollarPointCloud alloc] initWithName:@"T" points:
    @[
    [[DollarPoint alloc] initWithId:@(1) x:30 y:7],
    [[DollarPoint alloc] initWithId:@(1) x:103 y:7],
    [[DollarPoint alloc] initWithId:@(2) x:66 y:7],
    [[DollarPoint alloc] initWithId:@(2) x:66 y:87]]];

    DollarP *dP = [[DollarP alloc] init];
    [dP setPointClouds:templatesArray];

    DollarResult *result = [dP recognize:pointsArray];

    NSLog(@"the score is %f\n", [result score]);

}

@end
