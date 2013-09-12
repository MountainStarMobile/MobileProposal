//
//  comRptDesc.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "comRptDesc.h"

@implementation comRptDesc
@synthesize rptNo, secName, msgType, desc01, desc02, desc03, desc04, desc05, seq;

- (void)dealloc
{
    [rptNo release], rptNo = nil;
    [secName release], secName = nil;
    [msgType release], msgType = nil;
    [desc01 release], desc01 = nil;
    [desc02 release], desc02 = nil;
    [desc03 release], desc03 = nil;
    [desc04 release], desc04 = nil;
    [desc05 release], desc05 = nil;
    [seq release], seq = nil;
    [super dealloc];
}

@end
