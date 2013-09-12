//
//  dmInfo.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/22.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "dmInfo.h"

@implementation dmInfo
@synthesize seq, docNo, docArea, comment, pmNo, dmDesc, dmDesc2;

- (void)dealloc
{
    [seq release], seq = nil;
    [docNo release], docNo = nil;
    [docArea release], docArea = nil;
    [comment release], comment = nil;
    [pmNo release], pmNo = nil;
    [dmDesc release], dmDesc = nil;
    [dmDesc2 release], dmDesc2 = nil;
    [super dealloc];
}
@end
