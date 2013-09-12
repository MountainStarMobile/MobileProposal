//
//  tgsaRange.m
//  MLIproposal
//
//  Created by 張星星 on 12/6/15.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "tgsaRange.h"

@implementation tgsaRange
@synthesize planCode, rateScale, rateSex, rateAge, maxRate, minRate;

- (void)dealloc
{
    [planCode release], planCode = nil;
    [rateScale release], rateScale = nil;
    [rateSex release], rateSex = nil;
    [rateAge release], rateAge = nil;
    [maxRate release], maxRate = nil;
    [minRate release], minRate = nil;
    [super dealloc];
}

@end
