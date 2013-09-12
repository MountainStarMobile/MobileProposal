//
//  invsArep.m
//  MLIproposal
//
//  Created by sinss on 12/8/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "invsArep.h"

@implementation invsArep
@synthesize planCode, rateAge, rateScale, rateSex, fee;

- (void)dealloc
{
    [planCode release], planCode = nil;
    [rateAge release], rateAge = nil;
    [rateScale release], rateScale = nil;
    [rateSex release], rateSex = nil;
    [fee release], fee = nil;
    [super dealloc];
}

@end
