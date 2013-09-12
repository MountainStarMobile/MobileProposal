//
//  lfAret.m
//  MLIproposal
//
//  Created by sinss on 12/8/3.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "lfAret.h"

@implementation lfAret
@synthesize pricingQx, pricingQxPerc, pricingIx;
@synthesize sex, age, etiYear;
@synthesize etiFactorT0, etiFactorT1, etiPeFactorT0, etiPeFactorT1;

- (void)dealloc
{
    [pricingQx release], pricingQx = nil;
    [pricingQxPerc release], pricingQxPerc = nil;
    [pricingIx release], pricingIx = nil;
    [sex release], sex = nil;
    [age release], age = nil;
    [etiYear release], etiYear = nil;
    [etiFactorT0 release], etiFactorT0 = nil;
    [etiFactorT1 release], etiFactorT1 = nil;
    [etiPeFactorT0 release], etiPeFactorT0 = nil;
    [etiPeFactorT1 release], etiPeFactorT1 = nil;
    [super dealloc];
}

@end
