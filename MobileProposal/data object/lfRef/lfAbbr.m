//
//  lfAbbr.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfAbbr.h"

@implementation lfAbbr

@synthesize planAbbrCode, planAbbrDesc, planType, abbrType;
@synthesize seq, fbInd;

- (void)dealloc
{
    [planAbbrCode release], planAbbrCode = nil;
    [planAbbrDesc release], planAbbrDesc = nil;
    [planType release], planType = nil;
    [abbrtype release], abbrtype = nil;
    [super dealloc];
}

@end
