//
//  updateLogGroup.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/29.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "updateLogGroup.h"

@implementation updateLogGroup
@synthesize version, updateLogArray;

- (void)dealloc
{
    [version release], version = nil;
    [updateLogArray release], updateLogArray = nil;
    [super dealloc];
}
@end
