//
//  customerRelationInfo.m
//  MobileProposal
//
//  Created by sinss on 13/1/15.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "customerRelationInfo.h"

@implementation customerRelationInfo
@synthesize clientId, clientName, relationCode, relationId, relationName;

- (void)dealloc
{
    [clientId release], clientId = nil;
    [clientName release], clientName = nil;
    [relationCode release], relationCode = nil;
    [relationId release], relationId = nil;
    [relationName release], relationName = nil;
    [super dealloc];
}
@end
