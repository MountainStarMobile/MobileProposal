//
//  uploadCloudResult.m
//  MLIproposal
//
//  Created by sinss on 12/12/12.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "uploadCloudResult.h"

@implementation uploadCloudResult
@synthesize fileName, cloudId, errorMessage, status;

- (void)dealloc
{
    [fileName release], fileName = nil;
    [cloudId release], cloudId = nil;
    [errorMessage release], errorMessage = nil;
    [status release], status = nil;
    [super dealloc];
}

@end
