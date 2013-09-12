//
//  simulateTarget.m
//  MLIproposal
//
//  Created by sinss on 12/8/26.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "simulateTarget.h"

@implementation simulateTarget
@synthesize invsCode, invsName, issueDate, startDate, currency, currencyName, currencyUnit;
@synthesize targetType, invsType, seq;

- (void)dealloc
{
    [invsCode release], invsCode = nil;
    [invsName release], invsName = nil;
    [issueDate release], issueDate = nil;
    [currency release], currency = nil;
    [currencyName release], currencyName = nil;
    [currencyUnit release], currencyUnit = nil;
    [targetType release], targetType = nil;
    [invsType release], invsType = nil;
    [seq release], seq = nil;
    [super dealloc];
}

@end
