//
//  lfUwMatch.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfUwMatch.h"

@implementation lfUwMatch
@synthesize planAbbrCode, uwType, prjSeq, matchPlan, uwMsg;

- (void)dealloc
{
    [planAbbrCode release], planAbbrCode = nil;
    [uwType release], uwType = nil;
    [prjSeq release], prjSeq = nil;
    [matchPlan release], matchPlan = nil;
    [uwMsg release], uwMsg = nil;
    [super dealloc];
}

@end
