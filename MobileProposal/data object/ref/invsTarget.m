//
//  invsTarget.m
//  MLIproposal
//
//  Created by sinss on 12/8/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "invsTarget.h"

@implementation invsTarget
@synthesize invsCode, invsTitle, invsCompanyBno;
@synthesize currencyType, invsType, invsStsCode, invsStsDate, invsMiniAmt;
@synthesize showOrder, prjType, invsRate, invsValue, invsValueDate;

- (void)dealloc
{
    [invsCode release], invsCode = nil;
    [invsTitle release], invsTitle = nil;
    [invsCompanyBno release], invsCompanyBno = nil;
    [currencyType release], currencyType = nil;
    [invsStsCode release], invsStsCode = nil;
    [invsStsDate release], invsStsDate = nil;
    [invsMiniAmt release], invsMiniAmt = nil;
    [showOrder release], showOrder = nil;
    [invsRate release], invsRate = nil;
    [invsValue release], invsValue = nil;
    [invsValueDate release], invsValueDate = nil;
    [super dealloc];
}


@end
