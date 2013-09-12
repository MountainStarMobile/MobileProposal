//
//  vivhs.m
//  MLIproposal
//
//  Created by sinss on 12/8/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "vivhs.h"

@implementation vivhs
@synthesize invsCode, invsDate, currency, invsTitle, invsValue;

- (void)dealloc
{
    [invsCode release], invsCode = nil;
    [invsDate release], invsDate = nil;
    [currency release], currency = nil;
    [invsTitle release], invsTitle = nil;
    [invsValue release], invsValue = nil;
    [super dealloc];
}

@end
