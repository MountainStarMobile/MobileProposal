//
//  bodyTypeInfo.m
//  MLIproposal
//
//  Created by 張星星 on 12/6/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "bodyTypeInfo.h"

@implementation bodyTypeInfo
@synthesize bodyType, bodyDesc;

- (void)dealloc
{
    [bodyType release], bodyType = nil;
    [bodyDesc release], bodyDesc = nil;
    [super dealloc];
}

@end
