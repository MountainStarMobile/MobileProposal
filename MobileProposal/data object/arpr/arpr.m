//
//  arpr.m
//  MLIproposal
//
//  Created by sinss on 12/8/3.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "arpr.h"

@implementation arpr
@synthesize prPlanCode, prRateScale, sex, age, dur;
@synthesize pvUnitValue, cvUnitValue, cpFactor, rpuFactor;

- (void)dealloc
{
    [prPlanCode release], prPlanCode = nil;
    [prRateScale release], prRateScale = nil;
    [sex release], sex = nil;
    [age release], age = nil;
    [dur release], dur = nil;
    [pvUnitValue release], pvUnitValue = nil;
    [cvUnitValue release], cvUnitValue = nil;
    [cpFactor release], cpFactor = nil;
    [rpuFactor release], rpuFactor = nil;
    [super dealloc];
}

@end
