//
//  lfFundResult.m
//  MLIproposal
//
//  Created by 張星星 on 12/6/21.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfFundResult.h"

@implementation lfFundResult
@synthesize fundSeq, fundContent, fund1, fund2, fund3, type;

- (void)dealloc
{
    [fundSeq release], fundSeq = nil;
    [fundContent release], fundContent = nil;
    [fund1 release], fund1 = nil;
    [fund2 release], fund2 = nil;
    [fund3 release], fund3 = nil;
    [type release], type = nil;
    [super dealloc];
}

@end
