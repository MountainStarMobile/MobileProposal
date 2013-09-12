//
//  lfCrat.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfCrat.h"

@implementation lfCrat
@synthesize commPlanCode, commRateScale, premYearStart, premYearEnd, insuAgeStart, insuAgeEnd, commRate;

- (void)dealloc
{
    [commPlanCode release], commPlanCode = nil;
    [commRateScale release], commRateScale = nil;
    [premYearStart release], premYearStart = nil;
    [premYearEnd release], premYearEnd = nil;
    [insuAgeStart release], insuAgeStart = nil;
    [insuAgeEnd release], insuAgeEnd = nil;
    [commRate release], commRate = nil;
    [super dealloc];
}

@end
