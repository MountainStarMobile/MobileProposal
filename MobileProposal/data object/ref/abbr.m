//
//  abbr.m
//  MLIproposal
//
//  Created by 張星星 on 12/2/16.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "abbr.h"

@implementation abbr

@synthesize planAbbrCode,planAbbrDesc,planType,abbrType;
@synthesize seq, fbInd, proposalType, companyCode, brokerCode;

- (void)dealloc
{
    [planAbbrCode release], planAbbrCode = nil;
    [planAbbrDesc release], planAbbrDesc = nil;
    [planType release], planType = nil;
    [abbrType release], abbrType = nil;
    [seq release], seq = nil;
    [fbInd release], fbInd = nil;
    [proposalType release], proposalType = nil;
    [companyCode release], companyCode = nil;
    [brokerCode release], brokerCode = nil;
    [super dealloc];
}


@end
