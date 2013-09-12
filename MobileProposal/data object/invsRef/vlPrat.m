//
//  vlPrat.m
//  MLIproposal
//
//  Created by sinss on 12/8/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "vlPrat.h"

@implementation vlPrat
@synthesize planCode, rateAge, rateScale, rateSex, rateMedi ,premFactor;

- (void)dealloc
{
    [planCode release], planCode = nil;
    [rateAge release], rateAge = nil;
    [rateScale release], rateScale = nil;
    [rateSex release], rateSex = nil;
    [rateMedi release], rateMedi = nil;
    [premFactor release], premFactor = nil;
    [super dealloc];
}


@end
