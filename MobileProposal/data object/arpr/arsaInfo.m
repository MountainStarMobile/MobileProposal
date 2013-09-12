//
//  arsaInfo.m
//  MLIproposal
//
//  Created by sinss on 12/9/27.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "arsaInfo.h"

@implementation arsaInfo
@synthesize planCode, rateScale, age, dur, saFactor, addFactor;

- (void)dealloc
{
    [planCode release], planCode = nil;
    [rateScale release], rateScale = nil;
    [age release], age = nil;
    [dur release], dur = nil;
    [saFactor release], saFactor = nil;
    [addFactor release], addFactor = nil;
    [super dealloc];
}

@end
