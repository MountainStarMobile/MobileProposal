//
//  basicProposalManageDelegate.m
//  MobileProposal
//
//  Created by sinss on 13/1/16.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "basicProposalManageDelegate.h"

@implementation basicProposalManageDelegate
@synthesize delegate, PMTag, planArray, pldfArray, customerArray;

- (void)dealloc
{
    delegate = nil;
    [planArray release], planArray = nil;
    [pldfArray release], pldfArray = nil;
    [customerArray release], customerArray = nil;
    [super dealloc];
}

@end
