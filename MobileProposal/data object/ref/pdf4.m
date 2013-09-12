//
//  pdf4.m
//  MLIproposal
//
//  Created by sinss on 12/10/2.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "pdf4.h"

@implementation pdf4
@synthesize planAbbr, desc;

- (void)dealloc
{
    [planAbbr release], planAbbr = nil;
    [desc release], desc = nil;
    [super dealloc];
}

@end
