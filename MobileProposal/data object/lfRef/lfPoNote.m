//
//  lfPoNote.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfPoNote.h"

@implementation lfPoNote
@synthesize  planAbbrCode, seq, msgFile , premMini;

- (void)dealloc
{
    [planAbbrCode release], planAbbrCode = nil;
    [seq release], seq = nil;
    [msgFile release], msgFile = nil;
    [premMini release], premMini = nil;
    [super dealloc];
}

@end
