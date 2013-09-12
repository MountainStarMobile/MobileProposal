//
//  fileInfo.m
//  MLIproposal
//
//  Created by sinss on 12/10/23.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "fileInfo.h"

@implementation fileInfo
@synthesize fileDesc, fileName, fileVersion;

- (void)dealloc
{
    [fileDesc release], fileDesc = nil;
    [fileName release], fileName = nil;
    [fileVersion release], fileVersion = nil;
    [super dealloc];
}
@end
