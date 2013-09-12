//
//  updateLogInfo.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/29.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "updateLogInfo.h"

@implementation updateLogInfo
@synthesize date, log, version, seq;

- (void) dealloc
{
    [date release], date = nil;
    [log release], log = nil;
    [version release], version = nil;
    [super dealloc];
}
@end
