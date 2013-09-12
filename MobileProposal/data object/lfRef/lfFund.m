//
//  lfFund.m
//  MLIproposal
//
//  Created by 張星星 on 12/6/24.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfFund.h"

@implementation lfFund
@synthesize planDesc, seq, itemType, itemDesc, itemValue, valueType, valueLimit;

- (void)dealloc
{
    [planDesc release], planDesc = nil;
    [seq release], seq = nil;
    [itemType release], itemType = nil;
    [itemDesc release], itemDesc = nil;
    [itemValue release], itemValue = nil;
    [valueLimit release], valueLimit = nil;
    [valueType release], valueType = nil;
    [super dealloc];
}

@end
