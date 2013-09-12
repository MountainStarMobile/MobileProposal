//
//  loginLogInfo.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/27.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "loginLogInfo.h"

@implementation loginLogInfo
@synthesize agentCode, agentName, loginDate, log, seq;

- (void)dealloc
{
    [agentCode release], agentCode = nil;
    [agentName release], agentName = nil;
    [loginDate release], loginDate = nil;
    [log release], log = nil;
    [super dealloc];
}
@end
