//
//  classInfo.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/25.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "classInfo.h"

@implementation classInfo
@synthesize seq, docNo, docArea, docName, file, docName2;

- (void)dealloc
{
    [seq release], seq = nil;
    [docNo release], docNo = nil;
    [docArea release], docArea = nil;
    [docName release], docName = nil;
    [docName2 release], docName2 = nil;
    [file release], file = nil;
    [super dealloc];
}

@end
