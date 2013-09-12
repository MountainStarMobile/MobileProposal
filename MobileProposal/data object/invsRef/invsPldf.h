//
//  invsPldf.h
//  MLIproposal
//
//  Created by 張星星 on 12/6/1.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface invsPldf : NSObject
{
    NSString *planCode;
    NSString *rateScale;
    NSString *planDesc;
    NSString *planAbbrCode;
    NSString *planClassCode;
    NSString *planCloseDate;
    NSNumber *insurableAgeHigh;
    NSNumber *insurableAgeLow;
    NSString *planObjArray;
    NSString *planTermInd;
    NSString *faceAmtType;
    NSNumber *faceAmtMaxi;
    NSNumber *faceAmtMini;
    NSNumber *faceAmtChdMaxi;
    NSString *unitValueInd;
    NSNumber *unitValue;
    NSNumber *coverageYearAge;
    NSNumber *coverageYearDur;
    NSNumber *premiumYearDur;
    NSNumber *premiumYearAge;
    NSString *modeInd;
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
    NSString *commPlanCode;
    NSString *commRateScale;
    NSString *primaryRiderInd;
    NSNumber *renewableAge;
    NSString *deathBenefitInd;
    NSNumber *pricingIx;
    NSString *pricingQx;
    NSNumber *pricingQxPerc;
    NSString *expnPtr;
    NSString *feldPtr;
    NSString *coiAgeInd;
    NSString *coiSexInd;
    NSString *valueRefundInd;
    NSNumber *valueRefundRef;
    NSNumber *refundStartYear;
    NSNumber *refundCycleYears;
    NSString *refundBaseInd;
    NSString *pathAthInd;
    NSString *athClassCode;
    NSString *athRateScale;
    NSString *loadingPlanCode;
    NSString *loadingRateScale;
    NSString *ratingInd;
    NSString *planType;
    NSNumber *planAbbrOrder;
    NSNumber *periodOrder;
    NSString *periodDesc;
    NSString *planCodeOrder;
    NSString *planCodeDesc;
}

@property (nonatomic, retain) NSString *planCode;
@property (nonatomic, retain) NSString *rateScale;
@property (nonatomic, retain) NSString *planDesc;
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSString *planClassCode;
@property (nonatomic, retain) NSString *planCloseDate;
@property (nonatomic, retain) NSNumber *insurableAgeHigh;
@property (nonatomic, retain) NSNumber *insurableAgeLow;
@property (nonatomic, retain) NSString *planObjArray;
@property (nonatomic, retain) NSString *planTermInd;
@property (nonatomic, retain) NSString *faceAmtType;
@property (nonatomic, retain) NSNumber *faceAmtMaxi;
@property (nonatomic, retain) NSNumber *faceAmtMini;
@property (nonatomic, retain) NSNumber *faceAmtChdMaxi;
@property (nonatomic, retain) NSString *unitValueInd;
@property (nonatomic, retain) NSNumber *unitValue;
@property (nonatomic, retain) NSNumber *coverageYearAge;
@property (nonatomic, retain) NSNumber *coverageYearDur;
@property (nonatomic, retain) NSNumber *premiumYearDur;
@property (nonatomic, retain) NSNumber *premiumYearAge;
@property (nonatomic, retain) NSString *modeInd;
@property (nonatomic, retain) NSString *premCalcType;
@property (nonatomic, retain) NSString *premRateInd;
@property (nonatomic, retain) NSString *ratePlanCode;
@property (nonatomic, retain) NSString *rateRateScale;
@property (nonatomic, retain) NSString *rateAgeInd;
@property (nonatomic, retain) NSString *rateDurInd;
@property (nonatomic, retain) NSString *rateSexInd;
@property (nonatomic, retain) NSString *rateMediInd;
@property (nonatomic, retain) NSString *rateOccuInd;
@property (nonatomic, retain) NSString *rateInsuInd;
@property (nonatomic, retain) NSString *commPlanCode;
@property (nonatomic, retain) NSString *commRateScale;
@property (nonatomic, retain) NSString *primaryRiderInd;
@property (nonatomic, retain) NSNumber *renewableAge;
@property (nonatomic, retain) NSString *deathBenefitInd;
@property (nonatomic, retain) NSNumber *pricingIx;
@property (nonatomic, retain) NSString *pricingQx;
@property (nonatomic, retain) NSNumber *pricingQxPerc;
@property (nonatomic, retain) NSString *expnPtr;
@property (nonatomic, retain) NSString *feldPtr;
@property (nonatomic, retain) NSString *coiAgeInd;
@property (nonatomic, retain) NSString *coiSexInd;
@property (nonatomic, retain) NSString *valueRefundInd;
@property (nonatomic, retain) NSNumber *valueRefundRef;
@property (nonatomic, retain) NSNumber *refundStartYear;
@property (nonatomic, retain) NSNumber *refundCycleYears;
@property (nonatomic, retain) NSString *refundBaseInd;
@property (nonatomic, retain) NSString *pathAthInd;
@property (nonatomic, retain) NSString *athClassCode;
@property (nonatomic, retain) NSString *athRateScale;
@property (nonatomic, retain) NSString *loadingPlanCode;
@property (nonatomic, retain) NSString *loadingRateScale;
@property (nonatomic, retain) NSString *ratingInd;
@property (nonatomic, retain) NSString *planType;
@property (nonatomic, retain) NSNumber *planAbbrOrder;
@property (nonatomic, retain) NSNumber *periodOrder;
@property (nonatomic, retain) NSString *periodDesc;
@property (nonatomic, retain) NSString *planCodeOrder;
@property (nonatomic, retain) NSString *planCodeDesc;

@end
