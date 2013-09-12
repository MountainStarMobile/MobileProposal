//
//  DatabaseAccess.h
//  MLIproposal
//
//  Created by 張星星 on 12/2/15.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatabaseFunction.h"
#import "FMDatabase.h"
#import "FMResultSet.h"
#import "FMDatabaseAdditions.h"
#import "databaseImport.h"

@interface DatabaseAccess : NSObject
{
    FMDatabase *db;
}
+(DatabaseAccess*) databaseAccessInstance;
/*
 lfRef.sqlite
 */
- (void)openConnection;
- (NSArray*)loadAbbrWithPlantype:(NSString*)planType;
- (NSArray*)loadPlanAidWithPlanAbbr:(NSString*)abbrCode;
- (NSArray*)loadPlanAidWithPlanAbbr:(NSString*)abbrCode andPeriod:(NSInteger)period;
- (NSArray*)loadUwMatchWithPlanAbbrArray:(NSArray*)planArray;
- (NSArray*)loadUwMatch2WithPlanAbbrArray:(NSArray*)planArray;
- (NSArray*)loadUwRangeWithPlanAbbrArray:(NSArray*)planArray;
- (NSArray*)loadUwRatioWithPlanAbbrArray:(NSArray*)planArray;
- (NSArray*)loadUwVS;
- (lfUwAge*)loadUwAgeWithPlanCode:(NSString*)planCode andSex:(NSString*)sex andAge:(NSNumber*)age;
- (lfClcr*)loadClcrWithPlanCode:(NSString*)planCode andClItem:(NSString*)clItem;
- (NSArray*)loadClcrWithClItem:(NSString*)clItem;
- (NSArray*)loadInsuranceRuleWithType:(NSString*)type;
- (lfCrat*)loadLfCratWithPlanCode:(NSString*)planCode andPremiumYearDur:(NSNumber*)premDur andPlanAbbr:(NSString*)planAbbr andSex:(NSString*)sex andAge:(NSNumber*)age andO1Age:(NSNumber*)ageo1;
- (lfHrat*)loadLfHratWithPlanAbbrCode:(NSString*)planAbbr andTargetNumber:(NSNumber*)targetNumber;
- (NSArray*)loadLfPoNoteWithPlanAbbr:(NSString*)planAbbr;
- (NSArray*)loadLfPoNoteDescWithMsgFile:(NSString*)msgFile;
- (NSArray*)loadComRptDescWithPlanAbbr:(NSString*)planAbbr andPlanCode:(NSString*)planCode;
- (lfCalcu*)loadLfCalcuWithPlanAbbr:(NSString*)planAbbr;
- (NSArray*)loadLfPremWithpldf:(pldf*)apldf andSocialInd:(NSString*)social andCustomer:(customerInfo*)customer andFaceAmt:(NSNumber*)amt;
- (NSArray*)loadLfPratWithpldf:(pldf*)apldf andSocialInd:(NSString*)social andCustomer:(customerInfo*)customer;
- (lfPrat*)loadLfPratWithPldf:(pldf*)currentPldf andCustomerInfo:(customerInfo*)customer andSocialInd:(NSString *)social andRateDur:(NSNumber*)dur;
- (NSArray*)loadLfFundList;
- (pldf*)getLfPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType;
/*
 load :
 sa.sqlite
 cp.sqlite
 pv.sqlite
 cv.sqlite
 rpu.sqlite
 lfAret.sqlite
 */
- (lfSa*)loadArprFromSaWithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age andSex:(NSString*)sex;
- (lfSa*)loadArprFromSaWithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age;
- (NSArray*)loadArsaFromArsaWithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age;
- (lfCp*)loadArprFromCp2WithPlanCode:(NSString*)plancode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age andSex:(NSString*)sex;
- (lfCp*)loadArprFromCpWithPlanCode:(NSString*)plancode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age;
- (lfCv*)loadArprFromCvWithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age andSex:(NSString*)sex;
- (lfCv*)loadArprFromCv2WithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age andSex:(NSString*)sex;
- (lfPv*)loadArprFromPvWithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age andSex:(NSString*)sex;
- (lfPv*)loadArprFromPv2WithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age andSex:(NSString*)sex;
- (lfRpu*)loadArprFromRpuWithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age andSex:(NSString*)sex;
- (NSArray*)loadAretFromAretWithPricingQx:(NSString*)pricingQx andPricingQxPerc:(NSNumber*)perc andPricingIx:(NSNumber*)pricingIx andCustomer:(customerInfo*)i1Customer;
- (NSArray*)loadArprFromArprWithPlanCode:(NSString*)planCode andCustomer:(customerInfo*)customer;
/*
 ref.sqlite
 */
- (NSArray*)getAbbrWithProposalType:(NSString*)proposalType andAbbrType:(NSString*)abbrType andPlanType:(NSString*)planType andProjectType:(NSUInteger)projectType;
- (NSArray*)getPlanAidWithPlanAbbr:(NSString*)planAbbr;
- (NSArray*)getPlanAidWithPlanAbbr:(NSString*)planAbbr andPeriod:(NSNumber*)period;
- (NSArray*)getOccuArray;
- (NSArray*)getOccuClass;
- (NSArray*)getOccuArrayWithOccuClass:(NSString*)occuClass;
- (NSString*)getPlanTypeWithPlanAbbr:(NSString*)planAbbr;
- (NSArray*)getBodyTypeArray;
- (pldf*)getPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType;
- (NSInteger)getDigitWithCurrency:(NSString*)currency;
- (NSString*)getCurrencyNameWithCurrency:(NSString*)currency;
- (NSString*)getDeclarebookIndWithPlanAbbr:(NSString*)planAbbr;
- (NSArray*)getInvsTargetWithInvsType:(NSString *)invsType andPlanAbbr:(NSString*)invsAbbr;
- (NSArray*)getInvsTargetValueWithInvsTargetCode:(NSString*)invsTarget;
- (NSArray*)getCurrencyArray;
- (NSArray*)getSimulateTargetWithPlanAbbrCode:(NSString*)planAbbr;
- (NSArray*)getCompanyIntro;
- (NSArray*)getImportantWithNo:(NSNumber*)number;
- (NSArray*)getReportInformationWithPlanAbbr:(NSString*)planAbbr;
- (NSArray*)getReportItemWithProposalType:(NSString*)proposalType;
- (NSArray*)getTSOWithTSOtype:(NSInteger)TSOor02TSO;
- (pdf4*)getPdf4WithPlanAbbr:(NSString*)planAbbr;
- (NSArray*)getOtherItemGroup;
- (NSArray*)getOtherItem;
/*
 invsRef.sqlite
 */
- (pldf*)getInvsPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType;
- (pldf*)getUlPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType;
- (vlPrat*)getVlPratWithPlanCode:(NSString*)planCode andCustomerInfo:(customerInfo*)customer;
- (vlPrat*)getVlPratWithPlanCode:(NSString *)planCode andCustomerInfo:(customerInfo *)customer andBodyType:(NSString*)bodyType;
- (ulPrat*)getUlPratWithPlanCode:(NSString*)planCode andCustomerInfo:(customerInfo*)customer;
- (tgsaRange*)getTgsaRangeWithPlanCode:(NSString*)planCode andSex:(NSString*)sex andAge:(NSInteger)age;
- (invsArep*)getInvsArepWithPlanCode:(NSString*)planCode andCustomer:(customerInfo*)customer;
- (invsRule*)getInvsRuleWithPlanType:(NSString*)planType andCustomer:(customerInfo*)customer;
- (NSArray*)getCoiWithPlanCode:(NSString*)planCode andCustomer:(customerInfo*)customer;
- (NSArray*)getFdlfWithFeldPtr:(NSString*)feldPtr;
- (NSArray*)getVcrdriWithExpnPtr:(NSString*)expnPtr;
- (NSArray*)getVrfdfWithExpnPtr:(NSString*)expnPtr;
- (NSArray*)getViradWithInvsCode:(NSString*)iRateRaisePtr;
- (invsTargetRule*)getInvsTargetRuleWithPlanCode:(NSString*)planCode andInvsTargetPrem:(NSNumber*)targetPrem;
/*
 hvaRef.sqlite
 */
- (pldf*)getHvaPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType;
- (pldf*)getVaPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType;
- (pldf*)getCnPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType;
/*
 anRef.sqlite
 */
- (pldf*)getAnPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType;
- (NSArray*)getAnPayDue:(NSString*)planCode andPricingIx:(NSNumber*)anPricingIx;
/*
 vivhs.sqlite
 */
- (NSArray*)getVivhsWithInvsCode:(NSString*)invsCode andStartInvsDate:(NSString*)startDate andSimulateMons:(NSNumber*)mons;
/*
 取得職業代碼
 */
- (NSDictionary*)getKindInOccu;

/*
 pass.sqlite
 */
- (BOOL)checkExistAgentCodeInPass:(NSString*)agentCode;
- (NSArray*)getLoginLogArray;
- (NSArray*)getUpdateLogArray;
/*
 saveProposal.sqlite
 */
- (NSMutableArray*)getSavePrposalArray;
- (NSArray*)getDateGroupFromSaveList;
- (NSArray*)getSavePlanWithFileName:(NSString*)fileName andProposalType:(NSString*)proposalType;
- (NSArray*)getInvsTargetInfoWithFileName:(NSString*)fileName;
- (NSArray*)getSaveReportDateArray;
- (NSArray*)getPolicyArray;
- (NSArray*)getClntArray;
- (NSArray*)getSaveSchedule;

- (BOOL)checkExistWithFileName:(NSString*)fileName;
- (BOOL)checkExistWithCustomerID:(NSString*)clientID;
- (BOOL)saveCustomerWithCustomerInfo:(customerInfo*)customer;
- (BOOL)saveProposalWithProposalInfo:(saveProposalInfo*)proposal;
- (BOOL)updateProposalWithFileName:(NSString*)fileName andCloudID:(NSString*)cloudID;
- (BOOL)savePlanWithSavePlanInfo:(savePlanInfo*)plan;
- (BOOL)saveInvsTargetInfoWithFileName:(NSString*)fileName andInvsTargetInfo:(invsTarget*)target;
- (BOOL)saveSaveReportWithFileName:(NSString*)fileName andFilePath:(NSString*)filePath andSerial:(NSInteger)serial andProcessDate:(NSString*)date andCustomerInfo:(customerInfo*)customer;
- (BOOL)deleteSaveFileWithFileName:(NSString*)fileName;
- (BOOL)deleteSaveReportWithFileName:(NSString*)fileName;
- (BOOL)deleteScheduleWithScheduleFileName:(NSString*)fileName;
/*
 data.sqlite
 */
- (NSArray*)GetServiceServiceData;
- (NSArray*)GetAbbrWithProposalType:(NSString *)proposalType andAbbrType:(NSString *)abbrType andPlanType:(NSString *)planType andProjectType:(NSUInteger)projectType andBrokerCode:(NSNumber*)brokerCode andPlanCategory:(NSString*)category andRelation:(NSString*)relation;
- (NSArray*)GetPlanAidWithPlanAbbrCode:(NSString *)planAbbr;
- (NSArray*)GetAllPlanAidDataWithRelation:(NSString*)relation andAge:(NSNumber*)age;
/*
 insuranceRef.sqlite
 */
@end
