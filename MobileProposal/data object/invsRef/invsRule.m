//
//  invsRule.m
//  MLIproposal
//
//  Created by sinss on 12/8/17.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "invsRule.h"

@implementation invsRule
@synthesize planType, start, end, factor;

- (void)dealloc
{
    [planType release], planType = nil;
    [start release], start = nil;
    [end release], end = nil;
    [factor release], factor = nil;
    [super dealloc];
}

@end
