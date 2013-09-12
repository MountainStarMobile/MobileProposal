//
//  savePlanInfo.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//
/*
 險種明細內容  table:savePlan
 */
#import <Foundation/Foundation.h>

#define clohFieldCound 41

enum
{
    planInfoFieldFileName = 0,
    planInfoFieldPlanCode = 1,
    planInfoFieldRateScale = 2,
    planInfoFieldPlanAbbrCode = 3,
    planInfoFieldPlanDesc = 4,
    planInfoFieldPlanType = 5,
    planInfoFieldRelationCode = 6,
    planInfoFieldDeclareRate = 7,
    planInfoFieldFaceAmt = 8,
    planInfoFieldModePrem = 9,
    planInfoFieldSocialInsurance = 10,
    planInfoFieldCwprInd = 11,
    planInfoFieldCwprPlan = 12,
    planInfoFieldIwprInd = 13,
    planInfoFieldIwprPlan = 14,
    planInfoFieldBodyType = 15,
    planInfoFieldInvsTargetPrem = 16,
    planInfoFieldFirstPrem = 17,
    planInfoFieldInvsPrem = 18,
    planInfoFieldInvsdurs = 19,
    planInfoFieldInvsRate = 20,
    planInfoFieldInvsFee = 21,
    planInfoFieldLoadingRate = 22,
    planInfoFieldCityRate = 23,
    planInfoFieldVaType = 24,
    planInfoFieldAnRate = 25,
    planInfoFieldAnDur = 26,
    planInfoFieldAnAge = 27,
    planInfoFieldAnPrem = 28,
    planInfoFieldAnPureAmt = 29,
    planInfoFieldAccuRateList = 30,
    planInfoFieldPeriodCertain = 31,
    planInfoFieldAnPayType = 32,
    planInfoFieldSaveInd = 33,
    planInfoFieldProjectType = 34,
    planInfoFieldPlanAbbrOrder = 35,
    planInfoFieldAgentCode = 36,
    planInfoFieldProposalType = 37,
    planInfoFieldAbbrType = 38,
    planInfoFieldRelationIndex = 39,
    planInfoFieldDeclarebookInd = 40,
};

@interface savePlanInfo : NSObject
{
    NSString *fileName;
    NSString *planCode;
    NSString *rateScale;
    NSString *planAbbrCode;
    NSString *planDesc;
    NSString *planType;
    NSString *relationCode;
    NSNumber *declareRate;
    NSNumber *faceAmt;
    NSString *socialInsurance;
    NSNumber *cwprInd;
    NSString *cwprPlan;
    NSNumber *iwprInd;
    NSString *iwprPlan;
    NSString *bodyType;
    NSNumber *firstPrem;
    NSNumber *invsPrem;
    NSNumber *invsDurs;
    NSNumber *invsRate;
    NSNumber *invsFee;
    NSString *loadingRate;
    NSNumber *cityRate;
    NSNumber *vaType;
    NSNumber *anRate;
    NSNumber *anDur;
    NSNumber *anAge;
    NSNumber *anPrem;
    NSNumber *anPurePrem;
    NSString *accuRateList;
    NSString *periodCertain;
    NSString *anPayType;
    NSString *projectType;    //一萬元專案 or 一般件
    NSNumber *saveInd;
    NSNumber *planAbbrOrder;
    NSString *agentCode;
    /*-------------------------*/
    NSString *proposalType;
    NSString *abbrType;
    NSNumber *relationIndex;
    NSNumber *originalPrem;
    NSNumber *factor;
    NSNumber *modePrem;
    NSNumber *cwprAmt;
    NSNumber *cwprPrem;
    NSNumber *cwprFactor;
    NSNumber *kwprAmt;
    NSNumber *kwprPrem;
    NSNumber *kwprFactor;
    NSNumber *hratFactor;
    NSString *hratType;
    NSString *declareBookInd;
    NSNumber *averagePrem;
    /*
     繳別保費
     */
    NSNumber *yearPrem;
    NSNumber *halfPrem;
    NSNumber *seasonPrem;
    NSNumber *monPrem;
    NSNumber *cwprYearPrem;
    NSNumber *cwprHalfPrem;
    NSNumber *cwprSeasonPrem;
    NSNumber *cwprMonthPrem;
    NSNumber *kwprYearPrem;
    NSNumber *kwprHalfPrem;
    NSNumber *kwprSeasonPrem;
    NSNumber *kwprMonthPrem;
    /*
     投資型各項加費
     */
    NSNumber *specFee;
    NSNumber *occuFee;
    NSNumber *fixFee;
    NSNumber *totalFixFee;
    NSNumber *invsTargetPrem;
    
    NSString *cloudId;
}
@property (nonatomic, retain) NSString *fileName;
@property (nonatomic, retain) NSString *planCode;
@property (nonatomic, retain) NSString *rateScale;
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSString *planDesc;
@property (nonatomic, retain) NSString *planType;
@property (nonatomic, retain) NSString *relationCode;
@property (nonatomic, retain) NSNumber *declareRate;
@property (nonatomic, retain) NSNumber *faceAmt;
@property (nonatomic, retain) NSString *socialInsurance;
@property (nonatomic, retain) NSNumber *cwprInd;
@property (nonatomic, retain) NSString *cwprPlan;
@property (nonatomic, retain) NSNumber *iwprInd;
@property (nonatomic, retain) NSString *iwprPlan;
@property (nonatomic, retain) NSString *bodyType;
@property (nonatomic, retain) NSNumber *firstPrem;
@property (nonatomic, retain) NSNumber *invsPrem;
@property (nonatomic, retain) NSNumber *invsDurs;
@property (nonatomic, retain) NSNumber *invsRate;
@property (nonatomic, retain) NSNumber *invsFee;
@property (nonatomic, retain) NSString *loadingRate;
@property (nonatomic, retain) NSNumber *cityRate;
@property (nonatomic, retain) NSNumber *vaType;
@property (nonatomic, retain) NSNumber *anRate;
@property (nonatomic, retain) NSNumber *anDur;
@property (nonatomic, retain) NSNumber *anAge;
@property (nonatomic, retain) NSNumber *anPrem;
@property (nonatomic, retain) NSNumber *anPurePrem;
@property (nonatomic, retain) NSString *accuRateList;
@property (nonatomic, retain) NSString *periodCertain;
@property (nonatomic, retain) NSString *anPayType;
@property (nonatomic, retain) NSString *projectType;
@property (nonatomic, retain) NSNumber *saveInd;
@property (nonatomic, retain) NSNumber *planAbbrOrder;
@property (nonatomic, retain) NSString *agentCode;
@property (nonatomic, retain) NSString *proposalType;
@property (nonatomic, retain) NSString *abbrType;
@property (nonatomic, retain) NSNumber *relationIndex;
@property (nonatomic, retain) NSNumber *factor;
@property (nonatomic, retain) NSNumber *originalPrem;
@property (nonatomic, retain) NSNumber *modePrem;
@property (nonatomic, retain) NSNumber *cwprAmt;
@property (nonatomic, retain) NSNumber *cwprPrem;
@property (nonatomic, retain) NSNumber *cwprFactor;
@property (nonatomic, retain) NSNumber *kwprAmt;
@property (nonatomic, retain) NSNumber *kwprPrem;
@property (nonatomic, retain) NSNumber *kwprFactor;
@property (nonatomic, retain) NSNumber *hratFactor;
@property (nonatomic, retain) NSString *hratType;
@property (nonatomic, retain) NSString *declarebookInd;
@property (nonatomic, retain) NSNumber *averagePrem;

@property (nonatomic, retain) NSNumber *yearPrem;
@property (nonatomic, retain) NSNumber *halfPrem;
@property (nonatomic, retain) NSNumber *seasonPrem;
@property (nonatomic, retain) NSNumber *monPrem;
@property (nonatomic, retain) NSNumber *cwprYearPrem;
@property (nonatomic, retain) NSNumber *cwprHalfPrem;
@property (nonatomic, retain) NSNumber *cwprSeasonPrem;
@property (nonatomic, retain) NSNumber *cwprMonthPrem;
@property (nonatomic, retain) NSNumber *kwprYearPrem;
@property (nonatomic, retain) NSNumber *kwprHalfPrem;
@property (nonatomic, retain) NSNumber *kwprSeasonPrem;
@property (nonatomic, retain) NSNumber *kwprMonthPrem;

@property (nonatomic, retain) NSNumber *specFee;
@property (nonatomic, retain) NSNumber *occuFee;
@property (nonatomic, retain) NSNumber *fixFee;
@property (nonatomic, retain) NSNumber *totalFixFee;
@property (nonatomic, retain) NSNumber *invsTargetPrem;

@property (nonatomic, retain) NSString *cloudId;

- (NSString*)GetCloudSQL;
+ (savePlanInfo*)GetSavePlanRecordWithCloudString:(NSString*)cloudString andCloudId:(NSString*)cloudId;

@end
