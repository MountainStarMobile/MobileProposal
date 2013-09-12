//
//  planIntro.m
//  MLIproposal
//
//  Created by 張星星 on 12/6/21.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "planIntroResult.h"

@implementation planIntroResult
@synthesize introduction, seq;

- (void)dealloc
{
    [introduction release], introduction = nil;
    [seq release], seq = nil;
    [super dealloc];
}

@end
