//
//  invsCoi.m
//  MLIproposal
//
//  Created by sinss on 12/8/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "invsCoi.h"

@implementation invsCoi
@synthesize planCode, rateScale, planAbbrCode, ageDur, sex, rateMedi, rateOccu, coiFactor;

- (void)dealloc
{
    [planCode release], planCode = nil;
    [rateScale release], rateScale = nil;
    [planAbbrCode release], planAbbrCode = nil;
    [ageDur release], ageDur = nil;
    [sex release], sex = nil;
    [rateMedi release], rateMedi = nil;
    [rateOccu release], rateOccu = nil;
    [coiFactor release], coiFactor = nil;
    [super dealloc];
}

@end
