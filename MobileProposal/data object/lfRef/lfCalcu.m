//
//  lfCalcu.m
//  MLIproposal
//
//  Created by 張星星 on 12/7/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfCalcu.h"

@implementation lfCalcu
@synthesize planAbbrCode, CAREind, DDind, ADind, CRind, RETURNind, LF1, LFmix;

- (void)dealloc
{
    [planAbbrCode release], planAbbrCode = nil;
    [CAREind release], CAREind = nil;
    [DDind release], DDind = nil;
    [ADind release], ADind = nil;
    [CRind release], CRind = nil;
    [RETURNind release], RETURNind = nil;
    [LF1 release], LF1 = nil;
    [LFmix release], LFmix = nil;
    [super dealloc];
}

@end
