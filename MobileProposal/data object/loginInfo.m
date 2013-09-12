//
//  loginInfo.m
//  MobileProposal
//
//  Created by sinss on 13/3/4.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "loginInfo.h"

@implementation loginInfo
@synthesize account, password;

- (void)dealloc
{
    [account release], account = nil;
    [password release], password = nil;
    [super dealloc];
}

@end
