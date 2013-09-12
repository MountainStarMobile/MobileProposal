//
//  lfPv.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/25.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfPv.h"

@implementation lfPv
@synthesize prPlanCode, prRateScale, age, sex, durs, pvUnitValue;

- (void)dealloc
{
    [prPlanCode release], prPlanCode = nil;
    [prRateScale release], prRateScale = nil;
    [age release], age = nil;
    [sex release], sex = nil;
    [durs release], durs = nil;
    [pvUnitValue release], pvUnitValue = nil;
    [super dealloc];
}
@end
