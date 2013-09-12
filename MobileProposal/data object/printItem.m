//
//  printItem.m
//  MLIproposal
//
//  Created by sinss on 12/9/12.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "printItem.h"

@implementation printItem
@synthesize printItemCode, printItemDesc, proposalType, printRule, defaultValue, seq;
@synthesize isSelected;

- (void)dealloc
{
    [printItemCode release], printItemCode = nil;
    [printRule release], printRule = nil;
    [proposalType release], proposalType = nil;
    [printItemDesc release], printItemDesc = nil;
    [printRule release], printRule = nil;
    [defaultValue release], defaultValue = nil;
    [seq release], seq = nil;
    [super dealloc];
}

@end
