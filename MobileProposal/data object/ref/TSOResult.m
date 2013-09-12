//
//  TSOResult.m
//  MLIproposal
//
//  Created by sinss on 12/9/27.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "TSOResult.h"

@implementation TSOResult
@synthesize age1, age2, age3;
@synthesize male1, male2, male3;
@synthesize female1, female2, female3;

- (void)dealloc
{
    [age1 release], age1 = nil;
    [age2 release], age2 = nil;
    [age3 release], age3 = nil;
    [male1 release], male1 = nil;
    [male2 release], male2 = nil;
    [male3 release], male3 = nil;
    [female1 release], female1 = nil;
    [female2 release], female2 = nil;
    [female3 release], female3 = nil;
    [super dealloc];
}

@end
