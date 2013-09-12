//
//  uploadCloudResult.h
//  MLIproposal
//
//  Created by sinss on 12/12/12.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#define cloudIdXpath @"//result//cloudid"
#define cloudStatusXpath @"//result//status"

@interface uploadCloudResult : NSObject
{
    NSString *fileName;
    NSString *cloudId;
    NSString *status;
    NSString *errorMessage;
}
@property (nonatomic, retain) NSString *fileName;
@property (nonatomic, retain) NSString *cloudId;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *errorMessage;

@end
