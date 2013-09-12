//
//  insuranceProvisionInfo.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/21.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "insuranceProvisionInfo.h"

@implementation insuranceProvisionInfo

@synthesize planAbbrCode, planAbbrDesc, planType, abbrType, seq, fileName, declareInd;

- (void)dealloc
{
    [planAbbrCode release], planAbbrCode = nil;
    [planAbbrDesc release], planAbbrDesc = nil;
    [planType release], planType = nil;
    [abbrType release], abbrType = nil;
    [seq release], seq = nil;
    [fileName release], fileName = nil;
    [declareInd release], declareInd = nil;
    [super dealloc];
}

@end
