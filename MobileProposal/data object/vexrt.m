//
//  vexrt.m
//  MLIproposal
//
//  Created by sinss on 12/8/21.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "vexrt.h"

@implementation vexrt
@synthesize exrtDate, currency, buyingRate, exrtSourceInd;

- (void)dealloc
{
    [exrtDate release], exrtDate = nil;
    [currency release], currency = nil;
    [buyingRate release], buyingRate = nil;
    [exrtSourceInd release], exrtSourceInd = nil;
    [super dealloc];
}

@end
