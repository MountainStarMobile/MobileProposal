//
//  planAid.m
//  MLIproposal
//
//  Created by 張星星 on 12/2/16.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "planAid.h"

@implementation planAid

@synthesize planType,planAbbrCode,planAbbrDesc;
@synthesize periodOrder,periodDesc,planCodeOrder,planCodeDesc;
@synthesize IPlanCode,SPlanCode,CPlanCode, proposalType, companyCode, brokerCode;

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
    [proposalType release], proposalType = nil;
    [periodOrder release], periodOrder = nil;
    [planCodeOrder release], planCodeOrder = nil;
    [companyCode release], companyCode = nil;
    [brokerCode release], brokerCode = nil;
    [super dealloc];
}

@end
