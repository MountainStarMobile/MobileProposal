//
//  anPayDue.m
//  MLIproposal
//
//  Created by sinss on 12/9/4.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "anPayDue.h"

@implementation anPayDue
@synthesize planCode, rateScale, age, sex, dur, anPricingIx, aDue;

- (void)dealloc
{
    [planCode release], planCode = nil;
    [rateScale release], rateScale = nil;
    [age release], age = nil;
    [sex release], sex = nil;
    [dur release], dur = nil;
    [anPricingIx release], anPricingIx = nil;
    [aDue release], aDue = nil;
    [super dealloc];
}

@end
