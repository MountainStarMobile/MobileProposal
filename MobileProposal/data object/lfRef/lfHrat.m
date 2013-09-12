//
//  lfHrat.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfHrat.h"

@implementation lfHrat
@synthesize planAbbrCode, rateScale, premStart, premEnd, durEnd, durStart, discPerc;

- (void)dealloc
{
    [planAbbrCode release], planAbbrCode = nil;
    [rateScale release], rateScale = nil;
    [premStart release], premStart = nil;
    [premEnd release], premEnd = nil;
    [durStart release], durStart = nil;
    [durEnd release], durEnd = nil;
    [discPerc release], discPerc = nil;
    [super dealloc];
}

@end
