//
//  serviceTel.m
//  MobileProposal
//
//  Created by sinss on 13/1/16.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "serviceTel.h"

@implementation serviceTel
@synthesize companyName, telphone, type, seq;

- (void)dealloc
{
    [companyName release], companyName = nil;
    [telphone release], telphone = nil;
    [type release], type = nil;
    [seq release], seq = nil;
    [super dealloc];
}

@end
