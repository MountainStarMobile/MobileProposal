//
//  pldf.m
//  MLIproposal
//
//  Created by 張星星 on 12/2/16.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "pldf.h"

@implementation pldf

@synthesize planCode, rateScale, planDesc, planAbbrCode, planCloseDate, insurableAgeHigh, insurableAgeLow, faceAmtType, faceAmtMaxi, faceAmtMini;
@synthesize unitValueInd, unitValue, coverageYearAge, coverageYearDur, premiumYearAge, premiumYearDur, premCalcType, premRateInd;
@synthesize ratePlanCode, rateRateScale, rateAgeInd, rateDurInd, rateSexInd, rateInsuInd,rateMediInd, rateOccuInd;
@synthesize wpInd, primaryRiderInd, saPlanCode, saRateScale, prPlanCode, prRateScale, rpuInd, cvType, commPlanCode, commRateScale, hratExist, cpExist, cvExist, pvExist, planType, planAbbrOrder, periodOrder, periodDesc, planCodeOrder, planCodeDesc, pricingIx, divInd, currency;
/* invs */
@synthesize planClassCode, pricingQx, pricingQxPerc, expnPtr, feldPtr, coiAgeInd, coiSexInd, loadingPlanCode, loadingRateScale;
/* ul */
@synthesize iRateRaisePtr;
/* hva */
@synthesize promiseRate, attendRate, firstRate, baseRate, stdRate, liborRate, calcuType, modx;

- (void)dealloc
{
    [planCode release], planCode = nil;
    [rateScale release], rateScale = nil;
    [planDesc release], planDesc = nil;
    [planAbbrCode release], planAbbrCode = nil;
    [planCloseDate release], planCloseDate = nil;
    [faceAmtType release], faceAmtType = nil;
    [unitValueInd release], unitValueInd = nil;
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
    [wpInd release], wpInd = nil;
    [primaryRiderInd release], primaryRiderInd = nil;
    [saPlanCode release], saPlanCode = nil;
    [saRateScale release], saRateScale = nil;
    [prPlanCode release], prPlanCode = nil;
    [prRateScale release], prRateScale = nil;
    [rpuInd release], rpuInd = nil;
    [cvType release], cvType = nil;
    [commPlanCode release], commPlanCode = nil;
    [commRateScale release], commRateScale = nil;
    [hratExist release], hratExist = nil;
    [cpExist release], cpExist = nil;
    [cvExist release], cvExist = nil;
    [pvExist release], pvExist = nil;
    [planType release], planType = nil;
    [periodDesc release], periodDesc = nil;
    [planCodeDesc release], planCodeDesc = nil;
    [divInd release], divInd = nil;
    [currency release], currency = nil;
    [insurableAgeHigh release], insurableAgeHigh = nil;
    [insurableAgeLow release], insurableAgeLow = nil;
    [faceAmtMaxi release], faceAmtMaxi = nil;
    [faceAmtMini release], faceAmtMini = nil;
    [unitValue release], unitValue = nil;
    [coverageYearAge release], coverageYearAge = nil;
    [coverageYearDur release], coverageYearDur = nil;
    [premiumYearAge release], premiumYearAge = nil;
    [premiumYearDur release], premiumYearDur = nil;
    [planAbbrOrder release], planAbbrOrder = nil;
    [periodOrder release], periodOrder = nil;
    [planCodeOrder release], planCodeOrder = nil;
    [pricingIx release], pricingIx = nil;
    /*  invs  */
    [planClassCode release], planClassCode = nil;
    [pricingIx release], pricingIx = nil;
    [pricingQx release], pricingQx = nil;
    [pricingQxPerc release], pricingQxPerc = nil;
    [expnPtr release], expnPtr = nil;
    [feldPtr release], feldPtr = nil;
    [coiAgeInd release], coiAgeInd = nil;
    [coiSexInd release], coiSexInd = nil;
    [loadingPlanCode release], loadingPlanCode = nil;
    [loadingRateScale release], loadingRateScale = nil;
    /* ul */
    [iRateRaisePtr release], iRateRaisePtr = nil;
    /*  an  */
    [promiseRate release], promiseRate = nil;
    [attendRate release], attendRate = nil;
    [firstRate release], firstRate = nil;
    [baseRate release], baseRate = nil;
    [stdRate release], stdRate = nil;
    [liborRate release], liborRate = nil;
    [calcuType release], calcuType = nil;
    [modx release], modx = nil;
    [super dealloc];
}

@end
