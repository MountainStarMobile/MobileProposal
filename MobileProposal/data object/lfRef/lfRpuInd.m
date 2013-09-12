//
//  lfRpuInd.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfRpuInd.h"

@implementation lfRpuInd
@synthesize planCode, rateScale, planAbbrCode, primaryRiderInd, rpuInd, etiInd, pricingQx;
@synthesize pricingQxPerc, pricingIx;

- (void) dealloc
{
    [planCode release], planCode = nil;
    [rateScale release], rateScale = nil;
    [planAbbrCode release], planAbbrCode = nil;
    [primaryRiderInd release], primaryRiderInd = nil;
    [rpuInd release], rpuInd = nil;
    [etiInd release], etiInd = nil;
    [pricingQx release], pricingQx = nil;
    [pricingQxPerc release], pricingQxPerc = nil;
    [pricingIx release], pricingIx = nil;
    [super dealloc];
}

@end
