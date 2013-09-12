//
//  tgsaAmtRange.m
//  MLIproposal
//
//  Created by 張星星 on 12/6/15.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "tgsaAmtRange.h"

@implementation tgsaAmtRange
@synthesize planCode, targetPrem, minAmt, maxAmt;

- (void)dealloc
{
    [planCode release], planCode = nil;
    [targetPrme release], targetPrme = nil;
    [minAmt release], minAmt = nil;
    [maxAmt release], maxAmt = nil;
    [super dealloc];
}
@end
