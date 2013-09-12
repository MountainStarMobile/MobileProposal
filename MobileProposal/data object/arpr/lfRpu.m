//
//  lfRpu.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/25.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfRpu.h"

@implementation lfRpu
@synthesize prPlanCode, prRateScale, age, sex, durs, rpuUnitValue;

- (void)dealloc
{
    [prPlanCode release], prPlanCode = nil;
    [prRateScale release], prRateScale = nil;
    [age release], age = nil;
    [sex release], sex = nil;
    [durs release], durs = nil;
    [rpuUnitValue release], rpuUnitValue = nil;
    [super dealloc];
}
@end
