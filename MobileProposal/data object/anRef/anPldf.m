//
//  anPldf.m
//  MLIproposal
//
//  Created by 張星星 on 12/6/1.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "anPldf.h"

@implementation anPldf

@synthesize planCode, rateScale, planDesc, planAbbrCode, planCloseDate, insurableAgeHigh, insurableAgeLow;
@synthesize planObjArray, planTermInd, faceAmtType, faceAmtMaxi, faceAmtMini, faceAmtChdMaxi;
@synthesize unitValue, unitValueInd, coverageYearAge, coverageYearDur, premiumYearDur, premiumYearAge;
@synthesize modeInd, premCalcType, premRateInd, ratePlanCode, rateRateScale, rateAgeInd, rateSexInd, rateDurInd;
@synthesize rateMediInd, rateOccuInd, rateInsuInd, rateSubInd_1, rateSubInd_2, wpInd, primaryRiderInd, renewableAge;
@synthesize saPlanCode, saRateScale, prPlanCode, rpuInd, etiInd, cvType, commPlanCode, commRateScale, groupDiscInd;
@synthesize hratExist, cpExist, cvExist, pvExist, ratingInd, planType, planAbbrOrder, periodDesc, periodOrder;
@synthesize planCodeOrder, planCodeDesc, pricingIx, divInd, currency, etiMethod, prRateScale, saAgeInd;

- (void)dealloc
{
    [planCode release], planCode = nil;
    [rateScale release], rateScale = nil;
    [planDesc release], planDesc = nil;
    [planAbbrCode release], planAbbrCode = nil;
    [planCloseDate release], planCloseDate = nil;
    [planObjArray release], planObjArray = nil;
    [planTermInd release], planTermInd = nil;
    [faceAmtType release], faceAmtType = nil;
    [unitValueInd release], unitValueInd = nil;
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
    [rateSubInd_1 release], rateSubInd_1 = nil;
    [rateSubInd_2 release], rateSubInd_2 = nil;
    [wpInd release], wpInd = nil;
    [primaryRiderInd release], primaryRiderInd = nil;
    [saPlanCode release], saPlanCode = nil;
    [saRateScale release], saRateScale = nil;
    [saAgeInd release], saAgeInd = nil;
    [prPlanCode release], prPlanCode = nil;
    [prRateScale release], prRateScale = nil;
    [rpuInd release], rpuInd = nil;
    [etiInd release], etiInd = nil;
    [etiMethod release], etiInd = nil;
    [cvType release], cvType = nil;
    [commPlanCode release], commPlanCode = nil;
    [commRateScale release], commRateScale = nil;
    [groupDiscInd release], groupDiscInd = nil;
    [hratExist release], hratExist = nil;
    [cpExist release], cpExist = nil;
    [cvExist release], cvExist = nil;
    [pvExist release], pvExist = nil;
    [ratingInd release], ratingInd = nil;
    [planType release], planType = nil;
    [periodDesc release], periodDesc = nil;
    [planCodeDesc release], planCodeDesc = nil;
    [divInd release], divInd = nil;
    [currency release], currency = nil;
    [insurableAgeHigh release], insurableAgeHigh = nil;
    [insurableAgeLow release], insurableAgeLow = nil;
    [faceAmtMaxi release], faceAmtMaxi = nil;
    [faceAmtMini release], faceAmtMini = nil;
    [faceAmtChdMaxi release], faceAmtChdMaxi = nil;
    [unitValue release], unitValue = nil;
    [coverageYearAge release], coverageYearAge = nil;
    [coverageYearDur release], coverageYearDur = nil;
    [premiumYearAge release], premiumYearAge = nil;
    [premiumYearDur release], premiumYearDur = nil;
    [renewableAge release], renewableAge = nil;
    [planAbbrOrder release], planAbbrOrder = nil;
    [periodOrder release], periodOrder = nil;
    [planCodeOrder release], planCodeOrder = nil;
    [pricingIx release], pricingIx = nil;
    [super dealloc];
}

@end
