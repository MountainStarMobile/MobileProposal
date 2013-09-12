//
//  insuranceRule.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "insuranceRule.h"

@implementation insuranceRule
@synthesize type, planAbbrCode, seq;

- (void)dealloc
{
    [type release], type = nil;
    [planAbbrCode release], planAbbrCode = nil;
    [seq release], seq = nil;
    [super dealloc];
}

@end
