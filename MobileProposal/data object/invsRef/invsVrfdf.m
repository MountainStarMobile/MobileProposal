//
//  invsVrfdf.m
//  MLIproposal
//
//  Created by sinss on 12/8/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "invsVrfdf.h"

@implementation invsVrfdf
@synthesize feldPtr, poYearFrom, poYearTo, valueRefundPerc;

- (void)dealloc
{
    [feldPtr release], feldPtr = nil;
    [poYearFrom release], poYearFrom = nil;
    [poYearTo release], poYearTo = nil;
    [valueRefundPerc release], valueRefundPerc = nil;
    [super dealloc];
}

@end
