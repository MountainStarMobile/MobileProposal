//
//  lfClcr.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/13.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfClcr.h"

@implementation lfClcr
@synthesize planCode, rateScale, clItem, claimAmt;

- (void)dealloc
{
    [planCode release], planCode = nil;
    [rateScale release], rateScale = nil;
    [clItem release], clItem = nil;
    [claimAmt release], claimAmt = nil;
    [super dealloc];
}
@end
