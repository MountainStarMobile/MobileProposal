//
//  ulPrat.m
//  MLIproposal
//
//  Created by sinss on 12/8/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "ulPrat.h"

@implementation ulPrat
@synthesize planCode, rateScale, rateDur, rateSex, rateOccu, rateAge, rateInsu, rateUnit, premFactor;

- (void)dealloc
{
    [planCode release], planCode = nil;
    [rateScale release], rateScale = nil;
    [rateDur release], rateDur = nil;
    [rateSex release], rateSex = nil;
    [rateAge release], rateAge = nil;
    [rateInsu release], rateInsu = nil;
    [rateUnit release], rateUnit = nil;
    [premFactor release], premFactor = nil;
    [super dealloc];
}

@end
