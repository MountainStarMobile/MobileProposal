//
//  customerInfo.h
//  MLIproposal
//
//  Created by 張星星 on 12/4/21.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//
/*
 客戶資料檔   table:clnt
 */
#import <Foundation/Foundation.h>

#define clobFieldCound 19

enum
{
    clntFieldClientId = 0,
    clntFieldName = 1,
    clntFieldSex = 2,
    clntFieldBirthdate = 3,
    clntFieldMarriage = 4,
    clntFieldEducation = 5,
    clntFieldTel1 = 6,
    clntFieldTel2 = 7,
    clntFieldCellPhone = 8,
    clntFieldFax = 9,
    clntFieldEmail = 10,
    clntFieldZipCode = 11,
    clntFieldAddress = 12,
    clntFieldOccuCode = 13,
    clntFieldOccuLevel = 14,
    clntFieldRatingRateLf = 15,
    clntFieldAge = 16,
    clntFieldDataFlagIn = 17,
    clntFieldAgentCode = 18,
};

@interface customerInfo : NSObject
{
    NSString *relation;
    NSString *relationName;
    
    NSString *clientID;
    NSString *name;
    NSString *sex;
    NSString *birthDate;
    NSString *marriage;
    NSString *education;
    NSString *sec1;
    NSString *tel1;
    NSString *extend1;
    NSString *sec2;
    NSString *tel2;
    NSString *extend2;
    NSString *cellPhone;
    NSString *fax;
    NSString *email;
    NSString *zipCode;
    NSString *address;
    NSString *occuCode;
    NSNumber *occuLevel;
    NSNumber *ratingRateLf;
    NSNumber *age;
    NSString *dataFlagIn;
    NSNumber *seq;
    //是否能被選擇為對象
    BOOL canSelect;
    NSString *bodyType;
    BOOL sameCustomer;
    NSString *agentCode;
    NSString *cloudId;
    
    NSString *facebook;
    NSString *googlePlus;
    NSString *nickName;
}
@property (nonatomic, retain) NSString *relation;
@property (nonatomic, retain) NSString *relationName;
@property (nonatomic, retain) NSString *clientID;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *sex;
@property (nonatomic, retain) NSString *birthDate;
@property (nonatomic, retain) NSString *marriage;
@property (nonatomic, retain) NSString *education;
@property (nonatomic, retain) NSString *sec1;
@property (nonatomic, retain) NSString *tel1;
@property (nonatomic, retain) NSString *extend1;
@property (nonatomic, retain) NSString *sec2;
@property (nonatomic, retain) NSString *tel2;
@property (nonatomic, retain) NSString *extend2;
@property (nonatomic, retain) NSString *cellPhone;
@property (nonatomic, retain) NSString *fax;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *zipCode;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *occuCode;
@property (nonatomic, retain) NSNumber *occuLevel;
@property (nonatomic, retain) NSNumber *ratingRateLf;
@property (nonatomic, retain) NSNumber *age;
@property (nonatomic, retain) NSString *dataFlagIn;
@property (nonatomic, retain) NSNumber *seq;
@property (assign) BOOL canSelect;
@property (nonatomic, retain) NSString *bodyType;
@property (assign) BOOL sameCustomer;
@property (nonatomic, retain) NSString *agentCode;
@property (nonatomic, retain) NSString *cloudId;
@property (nonatomic, retain) NSString *facebook;
@property (nonatomic, retain) NSString *googlePlus;
@property (nonatomic, retain) NSString *nickName;

- (NSString*)GetCloudSQL;
+ (customerInfo*)GetCustomerRecordWithCloudString:(NSString*)cloudString andCloudId:(NSString*)cloudId;
- (customerInfo*)GetNewCopyCustomer;

@end
