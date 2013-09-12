//
//  agePrat.m
//  MobileProposal
//
//  Created by sinss on 13/2/19.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "agePrat.h"

@implementation agePrat
@synthesize age, maleFactor, femaleFactor;

- (void)dealloc
{
    [age release], age = nil;
    [maleFactor release], maleFactor = nil;
    [femaleFactor release], femaleFactor = nil;
    [super dealloc];
}

@end
