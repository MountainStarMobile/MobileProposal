//
//  occuInfo.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/29.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "occuInfo.h"

@implementation occuInfo
@synthesize occuCode, occuDesc, occuClass, occuLevel, fee;

- (void)dealloc
{
    [occuCode release], occuCode = nil;
    [occuClass release], occuClass = nil;
    [occuDesc release], occuDesc = nil;
    [occuLevel release], occuLevel = nil;
    [fee release], fee = nil;
    [super dealloc];
}

@end
