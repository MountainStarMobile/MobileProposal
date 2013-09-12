//
//  loginLogInfo.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/27.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface loginLogInfo : NSObject
{
    NSString *agentCode;
    NSString *agentName;
    NSString *loginDate;
    NSString *log;
    NSNumber *seq;
}
@property (nonatomic, retain) NSString *agentCode;
@property (nonatomic, retain) NSString *agentName;
@property (nonatomic, retain) NSString *loginDate;
@property (nonatomic, retain) NSString *log;
@property (nonatomic, retain) NSNumber *seq;

@end
