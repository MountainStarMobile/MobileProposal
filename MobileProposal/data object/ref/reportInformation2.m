//
//  reportInformation2.m
//  MLIproposal
//
//  Created by sinss on 12/9/10.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "reportInformation2.h"

@implementation reportInformation2
@synthesize desc1, desc2, desc3, seq;

- (void)dealloc
{
    [desc1 release], desc1 = nil;
    [desc2 release], desc2 = nil;
    [desc3 release], desc3 = nil;
    [seq release], seq = nil;
    [super dealloc];
}
@end
