//
//  lfUwAge.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfUwAge.h"

@implementation lfUwAge
@synthesize planCode, rateSex, rateAgeStart, rateAgeEnd, maxAmt, minAmt;

- (id)init
{
    self = [super init];
    if (self)
    {
        rateAgeStart = [[NSNumber alloc] initWithInt:0];
        rateAgeEnd = [[NSNumber alloc] initWithInt:0];
        maxAmt = [[NSNumber alloc] initWithInt:-1];
        minAmt = [[NSNumber alloc] initWithInt:-1];
    }
    return self;
}

- (void)dealloc
{
    [planCode release], planCode = nil;
    [rateSex release], rateSex = nil;
    [rateAgeStart release], rateAgeStart = nil;
    [rateAgeEnd release], rateAgeEnd = nil;
    [maxAmt release], maxAmt = nil;
    [minAmt release], minAmt = nil;
    [super dealloc];
}

@end
