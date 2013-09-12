//
//  customerContaceInfo.m
//  MobileProposal
//
//  Created by sinss on 13/1/15.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "customerContaceInfo.h"

@implementation customerContaceInfo
@synthesize date, content, status, statusMessage;

- (void)dealloc
{
    [date release], date = nil;
    [content release], content = nil;
    [status release], status = nil;
    [statusMessage release], statusMessage = nil;
    [super dealloc];
}

@end
