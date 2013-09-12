//
//  invsTargetRule.m
//  MLIproposal
//
//  Created by sinss on 12/11/5.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "invsTargetRule.h"

@implementation invsTargetRule
@synthesize planAbbrCode, minTarget, maxTarget, ratePlanCode;

- (void)dealloc
{
    [planAbbrCode release], planAbbrCode = nil;
    [minTarget release], minTarget = nil;
    [maxTarget release], maxTarget = nil;
    [ratePlanCode release], ratePlanCode = nil;
    [super dealloc];
}
@end
