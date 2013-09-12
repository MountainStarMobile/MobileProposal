//
//  reportInformation1.m
//  MLIproposal
//
//  Created by sinss on 12/9/10.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "reportInformation1.h"

@implementation reportInformation1
@synthesize type, detail, seq;

- (void)dealloc
{
    [type release], type = nil;
    [detail release], detail = nil;
    [seq release], seq = nil;
    [super dealloc];
}


@end
