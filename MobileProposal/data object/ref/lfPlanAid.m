//
//  lfPlanAid.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfPlanAid.h"

@implementation lfPlanAid

@synthesize planType,planAbbrCode,planAbbrDesc;
@synthesize periodOrder,periodDesc,planCodeOrder,planCodeDesc;
@synthesize IPlanCode,SPlanCode,CPlanCode;

- (void)dealloc
{
    [planType release], planType = nil;
    [planAbbrCode release], planAbbrCode = nil;
    [planAbbrDesc release], planAbbrDesc = nil;
    [periodDesc release], periodDesc = nil;
    [planCodeDesc release], planCodeDesc = nil;
    [IPlanCode release], IPlanCode = nil;
    [SPlanCode release], SPlanCode = nil;
    [CPlanCode release], CPlanCode = nil;
    [super dealloc];
}


@end
