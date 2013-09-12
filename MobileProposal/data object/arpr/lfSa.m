//
//  lfSa.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/25.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfSa.h"

@implementation lfSa
@synthesize saPlanCode, saRateScale, age, durs, saFactor;

- (void)dealloc
{
    [saPlanCode release], saPlanCode = nil;
    [saRateScale release], saRateScale = nil;
    [age release], age = nil;
    [durs release], durs = nil;
    [saFactor release], saFactor = nil;
    [super dealloc];
}

@end
