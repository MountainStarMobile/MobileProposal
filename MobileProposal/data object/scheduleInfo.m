//
//  scheduleInfo.m
//  MobileProposal
//
//  Created by sinss on 13/3/4.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "scheduleInfo.h"

@implementation scheduleInfo
@synthesize type, conetnt, clientId, clientName, processDate, startTime, endTime, status, scheduleId, agentName;

- (void)dealloc
{
    [type release], type = nil;
    [conetnt release], conetnt = nil;
    [clientId release], clientId = nil;
    [clientName release], clientName = nil;
    [processDate release], processDate = nil;
    [startTime release], startTime = nil;
    [endTime release], endTime = nil;
    [status release], status = nil;
    [scheduleId release], scheduleId = nil;
    [agentName release], agentName = nil;
    [super dealloc];
}

@end
