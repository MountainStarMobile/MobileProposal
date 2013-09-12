//
//  otherItem.m
//  MLIproposal
//
//  Created by sinss on 12/10/29.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "otherItem.h"

@implementation otherItem
@synthesize displayName, fileName, fileExt, groupName, seq;

- (void)dealloc
{
    [displayName release], displayName = nil;
    [fileName release], fileName = nil;
    [fileExt release], fileExt = nil;
    [groupName release], groupName = nil;
    [seq release], seq = nil;
    [super dealloc];
}

@end
