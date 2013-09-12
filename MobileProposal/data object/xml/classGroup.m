//
//  classGroup.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/25.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "classGroup.h"

@implementation classGroup
@synthesize groupName, classArray;

- (void)dealloc
{
    [groupName release], groupName = nil;
    [classArray release], classArray = nil;
    [super dealloc];
}


@end
