//
//  lfUwRatio.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfUwRatio.h"

@implementation lfUwRatio
@synthesize planAbbrCode, planAmt, uwType, ratioPlan, ratio, uwMsg;

- (void)dealloc
{
    [planAbbrCode release], planAbbrCode = nil;
    [planAmt release], planAmt = nil;
    [uwType release], uwType = nil;
    [ratioPlan release], ratioPlan = nil;
    [ratio release], ratio = nil;
    [uwMsg release], uwMsg = nil;
    [super dealloc];
}

@end
