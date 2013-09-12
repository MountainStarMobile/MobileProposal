//
//  ulPldf.m
//  MLIproposal
//
//  Created by 張星星 on 12/6/1.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "ulPldf.h"

@implementation ulPldf
@synthesize planCode, rateScale, planDesc, planAbbrCode, planClassCode, planCloseDate, insurableAgeHigh, insurableAgeLow;
@synthesize planObjArray, planTermInd, faceAmtType, faceAmtMaxi, faceAmtMini, faceAmtChdMaxi, unitValueInd, unitValue;
@synthesize coverageYearAge, coverageYearDur, premiumYearAge, premiumYearDur, ratePlanCode, rateRateScale, rateAgeInd;
@synthesize rateDurInd, rateSexInd, rateMediInd, rateOccuInd, rateInsuInd, commPlanCode, commRateScale, primaryRiderInd;
@synthesize renewableAge, deathBenefitInd, pricingIx, pricingQx, pricingQxPerc, expnPtr, feldPtr, coiAgeInd, coiSexInd;
@synthesize valueRefundInd, valueRefundRef, refundStartYear, refundCycleYears, refundBaseInd, pathAthInd, athClassCode;
@synthesize athRateScale, loadingPlanCode, loadingRateScale, ratingInd, planType, planAbbrOrder, periodOrder, periodDesc;
@synthesize modeInd, planCodeDesc, planCodeOrder, premCalcType, premRateInd;
@synthesize iRateRaiseInd, iRateRaisePtr, cpiRate, cpiOption, cpiInterval;

- (void)dealloc
{
    [planCode release], planCode = nil;
    [rateScale release], rateScale = nil;
    [planDesc release], planDesc = nil;
    [planAbbrCode release], planAbbrCode = nil;
    [planClassCode release], planClassCode = nil;
    [planCloseDate release], planCloseDate = nil;
    [insurableAgeHigh release], insurableAgeHigh = nil;
    [insurableAgeLow release], insurableAgeLow = nil;
    [planObjArray release], planObjArray = nil;
    [planTermInd release], planTermInd = nil;
    [faceAmtType release], faceAmtType = nil;
    [faceAmtMaxi release], faceAmtMaxi = nil;
    [faceAmtMini release], faceAmtMini = nil;
    [faceAmtChdMaxi release], faceAmtChdMaxi = nil;
    [unitValueInd release], unitValueInd = nil;
    [unitValue release], unitValue = nil;
    [coverageYearAge release], coverageYearAge = nil;
    [coverageYearDur release], coverageYearDur = nil;
    [premiumYearAge release], premiumYearAge = nil;
    [premiumYearDur release], premiumYearDur = nil;
    [modeInd release], modeInd = nil;
    [premCalcType release], premCalcType = nil;
    [premRateInd release], premRateInd = nil;
    [ratePlanCode release], ratePlanCode = nil;
    [rateRateScale release], rateRateScale = nil;
    [rateAgeInd release], rateAgeInd = nil;
    [rateDurInd release], rateDurInd = nil;
    [rateSexInd release], rateSexInd = nil;
    [rateMediInd release], rateMediInd = nil;
    [rateOccuInd release], rateOccuInd = nil;
    [rateInsuInd release], rateInsuInd = nil;
    [commPlanCode release], commPlanCode = nil;
    [commRateScale release], commRateScale = nil;
    [primaryRiderInd release], primaryRiderInd = nil;
    [renewableAge release], renewableAge = nil;
    [deathBenefitInd release], deathBenefitInd = nil;
    [pricingIx release], pricingIx = nil;
    [pricingQx release], pricingQx = nil;
    [pricingQxPerc release], pricingQxPerc = nil;
    [expnPtr release], expnPtr = nil;
    [feldPtr release], feldPtr = nil;
    [coiAgeInd release], coiAgeInd = nil;
    [coiSexInd release], coiSexInd = nil;
    [valueRefundInd release], valueRefundInd = nil;
    [valueRefundRef release], valueRefundRef = nil;
    [refundStartYear release], refundStartYear = nil;
    [refundCycleYears release], refundCycleYears = nil;
    [refundBaseInd release], refundBaseInd = nil;
    [pathAthInd release], pathAthInd = nil;
    [athClassCode release], athClassCode = nil;
    [athRateScale release], athRateScale = nil;
    [loadingPlanCode release], loadingPlanCode = nil;
    [loadingRateScale release], loadingRateScale = nil;
    [ratingInd release], ratingInd = nil;
    [planType release], planType = nil;
    [planAbbrOrder release], planAbbrOrder = nil;
    [periodOrder release], periodOrder = nil;
    [periodDesc release], periodDesc = nil;
    [planCodeOrder release], planCodeOrder = nil;
    [planCodeDesc release], planCodeDesc = nil;
    //ul
    [iRateRaiseInd release], iRateRaiseInd = nil;
    [iRateRaisePtr release], iRateRaisePtr = nil;
    [cpiOption release], cpiOption = nil;
    [cpiRate release], cpiRate = nil;
    [cpiInterval release], cpiInterval = nil;
    [super dealloc];
}

@end
