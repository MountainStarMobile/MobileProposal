//
//  lfPrat.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfPrat.h"

@implementation lfPrat

@synthesize planCode, rateScale, rateAge, rateDur, rateSex, rateInsu, rateUnit, premFactor;
@synthesize rateOccu;

- (void)dealloc
{
    [planCode release], planCode = nil;
    [rateScale release], rateScale = nil;
    [rateAge release], rateAge = nil;
    [rateDur release], rateDur = nil;
    [rateSex release], rateSex = nil;
    [rateOccu release], rateOccu = nil;
    [rateInsu release], rateInsu = nil;
    [rateUnit release], rateUnit = nil;
    [premFactor release], premFactor = nil;
    [super dealloc];
}
@end
