//
//  errorResult.m
//  MLIproposal
//
//  Created by 張星星 on 12/6/21.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "errorResult.h"

@implementation errorResult
@synthesize seq, planAbbr, errorMessage;

- (void)dealloc
{
    [seq release], seq = nil;
    [planAbbr release], planAbbr = nil;
    [errorMessage release], errorMessage = nil;
    [super dealloc];
}

@end
