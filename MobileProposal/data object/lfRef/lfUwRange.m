//
//  lfUwRange.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfUwRange.h"

@implementation lfUwRange
@synthesize planAbbrCode, seq, from, to, max, min, uwType, uwMsg, prjSeq;

- (void)dealloc
{
    [planAbbrCode release], planAbbrCode = nil;
    [seq release], seq = nil;
    [from release], from = nil;
    [to release], to = nil;
    [max release], max = nil;
    [min release], min = nil;
    [uwType release], uwType = nil;
    [uwMsg release], uwMsg = nil;
    [prjSeq release], prjSeq = nil;
    [super dealloc];
}

@end
