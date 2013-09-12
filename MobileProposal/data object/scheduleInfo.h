//
//  scheduleInfo.h
//  MobileProposal
//
//  Created by sinss on 13/3/4.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface scheduleInfo : NSObject
{
    NSString *type;
    NSString *conetnt;
    NSString *clientId;
    NSString *clientName;
    NSString *processDate;
    NSString *startTime;
    NSString *endTime;
    NSNumber *status;
    NSNumber *scheduleId;
    NSString *agentName;
}

@property (nonatomic ,retain) NSString *type;
@property (nonatomic, retain) NSString *conetnt;
@property (nonatomic, retain) NSString *clientId;
@property (nonatomic, retain) NSString *clientName;
@property (nonatomic, retain) NSString *processDate;
@property (nonatomic, retain) NSString *startTime;
@property (nonatomic, retain) NSString *endTime;
@property (nonatomic, retain) NSNumber *status;
@property (nonatomic, retain) NSNumber *scheduleId;
@property (nonatomic, retain) NSString *agentName;

@end
