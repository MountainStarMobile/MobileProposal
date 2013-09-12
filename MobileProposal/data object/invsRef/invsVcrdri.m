//
//  invsVcrdri.m
//  MLIproposal
//
//  Created by sinss on 12/8/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "invsVcrdri.h"

@implementation invsVcrdri
@synthesize planCode, rateScale, start, end, factorRate;

- (void)dealloc
{
    [planCode release], planCode = nil;
    [rateScale release], rateScale = nil;
    [start release], start = nil;
    [end release], end = nil;
    [factorRate release], factorRate = nil;
    [super dealloc];
}

@end
