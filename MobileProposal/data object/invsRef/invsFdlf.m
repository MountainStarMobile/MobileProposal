//
//  invsFdlf.m
//  MLIproposal
//
//  Created by sinss on 12/8/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "invsFdlf.h"

@implementation invsFdlf
@synthesize feldPtr, feldType, expnReasonCode, poYearFrom, poYearTo, feldCalcInd, feldBaseInd, feldCalcRef;

- (void)dealloc
{
    [feldPtr release], feldPtr = nil;
    [feldType release], feldType = nil;
    [expnReasonCode release], expnReasonCode = nil;
    [poYearFrom release], poYearFrom = nil;
    [poYearTo release], poYearTo = nil;
    [feldCalcInd release], feldCalcInd = nil;
    [feldCalcRef release], feldCalcRef = nil;
    [feldBaseInd release], feldBaseInd = nil;
    [super dealloc];
}

@end
