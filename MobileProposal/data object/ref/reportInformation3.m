//
//  reportInformation3.m
//  MLIproposal
//
//  Created by sinss on 12/9/10.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "reportInformation3.h"

@implementation reportInformation3
@synthesize itemNo1, itemDesc1, itemNo2, itemDesc2, seq;

- (void)dealloc
{
    [itemNo1 release], itemNo1 = nil;
    [itemDesc1 release], itemDesc1 = nil;
    [itemNo2 release], itemNo2 = nil;
    [itemDesc2 release], itemDesc2 = nil;
    [seq release], seq = nil;
    [super dealloc];
}
@end
