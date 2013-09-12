//
//  basicCustomerManageDelegate.m
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "basicCustomerManageDelegate.h"

@implementation basicCustomerManageDelegate
@synthesize CMTag, delegate, aCustomer;

- (void)dealloc
{
    delegate = nil;
    [aCustomer release], aCustomer = nil;
    [super dealloc];
}



@end
