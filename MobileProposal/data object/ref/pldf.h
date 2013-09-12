//
//  pldf.h
//  MLIproposal
//
//  Created by 張星星 on 12/2/16.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface pldf : NSObject
{
    NSString *planCode;
    NSString *rateScale;
    NSString *planDesc;
    NSString *planAbbrCode;
    NSString *planCloseDate;
    NSNumber *insurableAgeHigh;
    NSNumber *insurableAgeLow;
    NSString *faceAmtType;
    NSNumber *faceAmtMaxi;
    NSNumber *faceAmtMini;
    NSString *unitValueInd;
    NSNumber *unitValue;
    NSNumber *coverageYearAge;
    NSNumber *coverageYearDur;
    NSNumber *premiumYearDur;
    NSNumber *premiumYearAge;
    NSString *premCalcType;
    NSString *premRateInd;
    NSString *ratePlanCode;
    NSString *rateRateScale;
    NSString *rateAgeInd;
    NSString *rateDurInd;
    NSString *rateSexInd;
    NSString *rateMediInd;
    NSString *rateOccuInd;
    NSString *rateInsuInd;
    NSString *wpInd;
    NSString *primaryRiderInd;
    NSString *saPlanCode;
    NSString *saRateScale;
    NSString *prPlanCode;
    NSString *prRateScale;
    NSString *rpuInd;
    NSString *cvType;
    NSString *commPlanCode;
    NSString *commRateScale;
    NSString *hratExist;
    NSString *cpExist;
    NSString *cvExist;
    NSString *pvExist;
    NSString *planType;
    NSNumber *planAbbrOrder;
    NSNumber *periodOrder;
    NSString *periodDesc;
    NSNumber *planCodeOrder;
    NSString *planCodeDesc;
    NSNumber *pricingIx;
    NSString *divInd;
    NSString *currency;
    /* invs */
    NSString *planClassCode;
    NSString *pricingQx;
    NSNumber *pricingQxPerc;
    NSString *expnPtr;
    NSString *feldPtr;
    NSString *coiAgeInd;
    NSString *coiSexInd;
    NSString *loadingPlanCode;
    NSString *loadingRateScale;
    /* ul */
    NSString *iRateRaisePtr;
    /* hva */
    NSNumber *promiseRate;
    NSNumber *attendRate;
    NSNumber *firstRate;
    NSNumber *baseRate;
    NSNumber *stdRate;
    NSNumber *liborRate;
    NSString *calcuType;
    NSNumber *modx;
}
@property (nonatomic ,retain) NSString *planCode;
@property (nonatomic ,retain) NSString *rateScale;
@property (nonatomic ,retain) NSString *planDesc;
@property (nonatomic ,retain) NSString *planAbbrCode;
@property (nonatomic ,retain) NSString *planCloseDate;
@property (nonatomic ,retain) NSNumber *insurableAgeHigh;
@property (nonatomic ,retain) NSNumber *insurableAgeLow;
@property (nonatomic ,retain) NSString *faceAmtType;
@property (nonatomic ,retain) NSNumber *faceAmtMaxi;
@property (nonatomic ,retain) NSNumber *faceAmtMini;
@property (nonatomic ,retain) NSString *unitValueInd;
@property (nonatomic ,retain) NSNumber *unitValue;
@property (nonatomic ,retain) NSNumber *coverageYearAge;
@property (nonatomic ,retain) NSNumber *coverageYearDur;
@property (nonatomic ,retain) NSNumber *premiumYearDur;
@property (nonatomic ,retain) NSNumber *premiumYearAge;
@property (nonatomic ,retain) NSString *premCalcType;
@property (nonatomic ,retain) NSString *premRateInd;
@property (nonatomic ,retain) NSString *ratePlanCode;
@property (nonatomic ,retain) NSString *rateRateScale;
@property (nonatomic ,retain) NSString *rateAgeInd;
@property (nonatomic ,retain) NSString *rateDurInd;
@property (nonatomic ,retain) NSString *rateSexInd;
@property (nonatomic ,retain) NSString *rateMediInd;
@property (nonatomic ,retain) NSString *rateOccuInd;
@property (nonatomic ,retain) NSString *rateInsuInd;
@property (nonatomic ,retain) NSString *wpInd;
@property (nonatomic ,retain) NSString *primaryRiderInd;
@property (nonatomic ,retain) NSString *saPlanCode;
@property (nonatomic ,retain) NSString *saRateScale;
@property (nonatomic ,retain) NSString *prPlanCode;
@property (nonatomic ,retain) NSString *prRateScale;
@property (nonatomic ,retain) NSString *rpuInd;
@property (nonatomic ,retain) NSString *cvType;
@property (nonatomic ,retain) NSString *commPlanCode;
@property (nonatomic ,retain) NSString *commRateScale;
@property (nonatomic ,retain) NSString *hratExist;
@property (nonatomic ,retain) NSString *cpExist;
@property (nonatomic ,retain) NSString *cvExist;
@property (nonatomic ,retain) NSString *pvExist;
@property (nonatomic ,retain) NSString *planType;
@property (nonatomic ,retain) NSNumber *planAbbrOrder;
@property (nonatomic ,retain) NSNumber *periodOrder;
@property (nonatomic ,retain) NSString *periodDesc;
@property (nonatomic ,retain) NSNumber *planCodeOrder;
@property (nonatomic ,retain) NSString *planCodeDesc;
@property (nonatomic ,retain) NSNumber *pricingIx;
@property (nonatomic ,retain) NSString *divInd;
@property (nonatomic ,retain) NSString *currency;
/* invs */
@property (nonatomic, retain) NSString *planClassCode;
@property (nonatomic ,retain) NSString *pricingQx;
@property (nonatomic ,retain) NSNumber *pricingQxPerc;
@property (nonatomic ,retain) NSString *expnPtr;
@property (nonatomic ,retain) NSString *feldPtr;
@property (nonatomic ,retain) NSString *coiAgeInd;
@property (nonatomic ,retain) NSString *coiSexInd;
@property (nonatomic ,retain) NSString *loadingPlanCode;
@property (nonatomic ,retain) NSString *loadingRateScale;
/* ul */
@property (nonatomic, retain) NSString *iRateRaisePtr;
/* hva */
@property (nonatomic ,retain) NSNumber *promiseRate;
@property (nonatomic ,retain) NSNumber *attendRate;
@property (nonatomic ,retain) NSNumber *firstRate;
@property (nonatomic ,retain) NSNumber *baseRate;
@property (nonatomic ,retain) NSNumber *stdRate;
@property (nonatomic ,retain) NSNumber *liborRate;
@property (nonatomic ,retain) NSString *calcuType;
@property (nonatomic ,retain) NSNumber *modx;
@end
