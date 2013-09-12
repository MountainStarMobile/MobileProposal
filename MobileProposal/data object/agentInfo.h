//
//  agentInfo.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/5.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ag_agentCodeKey @"agentCode"
#define ag_agentNameKey @"agentName"
#define ag_deptCodeKey @"deptCode"
#define ag_telephoneKey @"telephone"
#define ag_addressKey @"address"
#define ag_mailKey @"mail"
#define ag_agentTypeKey @"agentType"
#define ag_writingClassKey @"writingClass"
#define ag_invsIdentKey @"invsIdent"
#define ag_fbIdentKey @"fbIdent"
#define ag_loginDateKey @"loginDate"
#define ag_loginStatusKey @"status.key"

@interface agentInfo : NSObject
{
    NSString *agentCode;
    NSString *agentName;
    NSString *deptCode;
    NSString *telephone;
    NSString *address;
    NSString *mail;
    NSString *agentType;
    NSString *writingClass;
    NSString *invsIdent;
    NSString *fbIdent;
    NSString *loginDate;
    NSString *status;
}
@property (nonatomic, retain) NSString *agentCode;
@property (nonatomic, retain) NSString *agentName;
@property (nonatomic, retain) NSString *deptCode;
@property (nonatomic, retain) NSString *telephone;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *mail;
@property (nonatomic, retain) NSString *agentType;
@property (nonatomic, retain) NSString *writingClass;
@property (nonatomic ,retain) NSString *invsIdent;
@property (nonatomic, retain) NSString *fbIdent;
@property (nonatomic, retain) NSString *loginDate;
@property (nonatomic, retain) NSString *status;


- (NSDictionary*)agentInfoToDictionary;
- (agentInfo*)dictionaryToAgentInfo:(NSDictionary*)dict;

@end