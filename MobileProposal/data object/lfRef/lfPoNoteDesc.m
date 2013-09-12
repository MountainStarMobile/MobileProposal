//
//  lfPoNoteDesc.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfPoNoteDesc.h"

@implementation lfPoNoteDesc
@synthesize msgFile, deatil, seq;

- (void)dealloc
{
    [msgFile release], msgFile = nil;
    [deatil release], deatil = nil;
    [seq release], seq = nil;
    [super dealloc];
}

@end
