//
//  lfUwVS.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfUwVS.h"

@implementation lfUwVS
@synthesize seq, groupA, groupB, aType, Afrom, Ato, Bvalue, uwMsg, prjSeq;

- (void)dealloc
{
    [seq release], seq = nil;
    [groupA release], groupA = nil;
    [groupB release], groupB = nil;
    [aType release], aType = nil;
    [Afrom release], Afrom = nil;
    [Ato release], Ato = nil;
    [Bvalue release], Bvalue = nil;
    [uwMsg release], uwMsg = nil;
    [prjSeq release], prjSeq = nil;
    [super dealloc];
}

@end
