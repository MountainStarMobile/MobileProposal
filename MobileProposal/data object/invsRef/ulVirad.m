//
//  ulVirad.m
//  MLIproposal
//
//  Created by sinss on 12/9/3.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "ulVirad.h"

@implementation ulVirad
@synthesize invsCode, poYearFrom, poYearTo, viradIndAdd;

- (void)dealloc
{
    [invsCode release], invsCode = nil;
    [poYearFrom release], poYearFrom = nil;
    [poYearTo release], poYearTo = nil;
    [viradIndAdd release], viradIndAdd = nil;
    [super dealloc];
}

@end
