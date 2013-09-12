//
//  saveProposalInfo.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//
/*
 存檔主檔  table:saveList
 */
#import <Foundation/Foundation.h>

#define proposalStatusXpath @"//result//status"
#define proposalCloudRecordXpath @"//result//record"

enum
{
    proposalInfoFieldFileName = 0,
    proposalInfoFieldAgentCode = 1,
    proposalInfoFieldI1Relation = 2,
    proposalInfoFieldO1Relation = 3,
    proposalInfoFieldSaveInd = 4,
    proposalInfoFieldCustomerInd = 5,
    proposalInfoFieldProposalType = 6,
    proposalInfoFieldPolicyNo = 7,
    proposalInfoFieldProcessDate = 8,
    proposalInfoFieldModx = 9,
    proposalInfoFieldCloudId = 10,
};

@class customerInfo;
@interface saveProposalInfo : NSObject
{
    NSString *fileName;
    NSString *agentCode;
    NSString *i1Relation;
    NSString *o1Relation;
    NSString *saveInd;
    NSString *customerInd;
    NSString *proposalType;
    NSString *policyNo;
    NSString *processDate;
    NSString *modx;
    NSString *cloudId;
    NSString *searchKey;
    /*
     擴充欄位
     */
    customerInfo *o1Customer;
    customerInfo *i1Customer;
}

@property (nonatomic, retain) NSString *fileName;
@property (nonatomic, retain) NSString *agentCode;
@property (nonatomic, retain) NSString *i1Relation;
@property (nonatomic, retain) NSString *o1Relation;
@property (nonatomic, retain) NSString *saveInd;
@property (nonatomic, retain) NSString *customerInd;
@property (nonatomic, retain) NSString *proposalType;
@property (nonatomic, retain) NSString *policyNo;
@property (nonatomic, retain) NSString *processDate;
@property (nonatomic, retain) NSString *modx;
@property (nonatomic, retain) NSString *cloudId;
@property (nonatomic, retain) NSString *searchKey;
@property (nonatomic, retain) customerInfo *o1Customer;
@property (nonatomic, retain) customerInfo *i1Customer;

- (NSString*)GetCloudSQL;
+ (saveProposalInfo*)GetProposalWithCloudString:(NSString*)cloudString;

@end
