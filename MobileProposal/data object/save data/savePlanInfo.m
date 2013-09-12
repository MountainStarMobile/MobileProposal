//
//  savePlanInfo.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "savePlanInfo.h"
#import "Base64.h"

@implementation savePlanInfo

@synthesize fileName, planCode, rateScale, planAbbrCode, planDesc, planType, relationCode, declareRate, faceAmt, socialInsurance;
@synthesize cwprInd, cwprPlan, iwprInd, iwprPlan, bodyType, firstPrem, invsPrem, invsDurs, invsRate, invsFee;
@synthesize loadingRate, cityRate, vaType, anRate, anDur, anAge, anPrem, anPurePrem, accuRateList;
@synthesize periodCertain, anPayType, projectType ,saveInd, planAbbrOrder, agentCode, declarebookInd, averagePrem;
@synthesize proposalType, relationIndex, abbrType, modePrem, factor, originalPrem, cwprAmt, cwprPrem, cwprFactor, kwprAmt, kwprPrem, kwprFactor;
@synthesize hratType, hratFactor;
@synthesize yearPrem, halfPrem, seasonPrem, monPrem;
@synthesize cwprYearPrem, cwprHalfPrem, cwprSeasonPrem, cwprMonthPrem;
@synthesize kwprYearPrem, kwprHalfPrem, kwprSeasonPrem, kwprMonthPrem;
@synthesize specFee, occuFee, fixFee, totalFixFee, invsTargetPrem;
@synthesize cloudId;

- (id)init
{
    self = [super init];
    if (self)
    {
        declareRate = [[NSNumber alloc] initWithDouble:0];
        modePrem = [[NSNumber alloc] initWithDouble:0];
        originalPrem = [[NSNumber alloc] initWithDouble:0];
        cwprInd = [[NSNumber alloc] initWithInt:0];
        cwprPlan = [[NSString alloc] initWithFormat:@""];
        cwprAmt = [[NSNumber alloc] initWithDouble:0];
        cwprPrem = [[NSNumber alloc] initWithDouble:0];
        iwprInd = [[NSNumber alloc] initWithInt:0];
        iwprPlan = [[NSString alloc] initWithFormat:@""];
        kwprAmt = [[NSNumber alloc] initWithDouble:0];
        kwprPrem = [[NSNumber alloc] initWithDouble:0];
        hratType = [[NSString alloc] initWithFormat:@"0"];
        hratFactor = [[NSNumber alloc] initWithDouble:0];
        invsFee = [[NSNumber alloc] initWithDouble:0];
        loadingRate = [[NSString alloc] initWithFormat:@""];
        anPrem = [[NSNumber alloc] initWithInt:0];
        anPurePrem = [[NSNumber alloc] initWithInt:0];
        accuRateList = [[NSString alloc] initWithFormat:@""];
        anPayType = [[NSString alloc] initWithFormat:@""];
        factor = [[NSNumber alloc] initWithDouble:0];
        cwprFactor = [[NSNumber alloc] initWithDouble:0];
        kwprFactor = [[NSNumber alloc] initWithDouble:0];
        yearPrem = [[NSNumber alloc] initWithDouble:0];
        halfPrem = [[NSNumber alloc] initWithDouble:0];
        seasonPrem = [[NSNumber alloc] initWithDouble:0];
        monPrem = [[NSNumber alloc] initWithDouble:0];
        cwprYearPrem = [[NSNumber alloc] initWithDouble:0];
        cwprHalfPrem = [[NSNumber alloc] initWithDouble:0];
        cwprSeasonPrem = [[NSNumber alloc] initWithDouble:0];
        cwprMonthPrem = [[NSNumber alloc] initWithDouble:0];
        kwprYearPrem = [[NSNumber alloc] initWithDouble:0];
        kwprHalfPrem = [[NSNumber alloc] initWithDouble:0];
        kwprSeasonPrem = [[NSNumber alloc] initWithDouble:0];
        kwprMonthPrem = [[NSNumber alloc] initWithDouble:0];
        specFee = [[NSNumber alloc] initWithDouble:0];
        occuFee = [[NSNumber alloc] initWithDouble:0];
        fixFee = [[NSNumber alloc] initWithDouble:0];
        totalFixFee = [[NSNumber alloc] initWithDouble:0];
        invsTargetPrem = [[NSNumber alloc] initWithDouble:0];
        accuRateList = [[NSString alloc] initWithFormat:@"0,1,2,2.5,3,4"];
        averagePrem = [[NSNumber alloc] initWithDouble:0];
        declareBookInd = [[NSString alloc] initWithFormat:@"0"];
        planAbbrOrder = [[NSNumber alloc] initWithInteger:0];
        projectType = [[NSString alloc] initWithFormat:@"0"];
    }
    return self;
}
- (void)dealloc
{
    [fileName release], fileName = nil;
    [planCode release], planCode = nil;
    [rateScale release], rateScale = nil;
    [planAbbrCode release], planAbbrCode = nil;
    [planDesc release], planDesc = nil;
    [planType release], planType = nil;
    [relationCode release], relationCode = nil;
    [declareRate release], declareRate = nil;
    [socialInsurance release], socialInsurance = nil;
    [cwprPlan release], cwprPlan = nil;
    [iwprPlan release], iwprPlan = nil;
    [bodyType release], bodyType = nil;
    [invsRate release], invsRate = nil;
    [loadingRate release], loadingRate = nil;
    [cityRate release], cityRate = nil;
    [anRate release], anRate = nil;
    [accuRateList release], accuRateList = nil;
    [anPayType release], anPayType = nil;
    [periodCertain release], periodCertain = nil;
    [agentCode release], agentCode = nil;
    [faceAmt release], faceAmt = nil;
    [cwprInd release], cwprInd = nil;
    [iwprInd release], iwprInd = nil;
    [firstPrem release], firstPrem = nil;
    [invsPrem release], invsPrem = nil;
    [invsDurs release], invsDurs = nil;
    [invsFee release], invsFee = nil;
    [vaType release], vaType = nil;
    [anDur release], anDur = nil;
    [anAge release], anAge = nil;
    [anPrem release], anPrem = nil;
    [anPurePrem release], anPurePrem = nil;
    [projectType release], projectType = nil;
    [saveInd release], saveInd = nil;
    [planAbbrOrder release], planAbbrOrder = nil;
    [declarebookInd release], declarebookInd = nil;
    [averagePrem release], averagePrem = nil;
    /*------------------------------------------*/
    [proposalType release], proposalType = nil;
    [abbrType release], abbrType = nil;
    [relationIndex release], relationIndex = nil;
    [factor release], factor = nil;
    [originalPrem release], originalPrem = nil;
    [modePrem release], modePrem = nil;
    [cwprAmt release], cwprAmt = nil;
    [cwprPrem release], cwprPrem = nil;
    [cwprFactor release], cwprFactor = nil;
    [kwprAmt release], kwprAmt = nil;
    [kwprPrem release], kwprPrem = nil;
    [kwprFactor release], kwprFactor = nil;
    [hratType release], hratType = nil;
    [hratFactor release], hratFactor = nil;
    [yearPrem release], yearPrem = nil;
    [halfPrem release], halfPrem = nil;
    [seasonPrem release], seasonPrem = nil;
    [monPrem release], monPrem = nil;
    [cwprYearPrem release], cwprYearPrem = nil;
    [cwprHalfPrem release], cwprHalfPrem = nil;
    [cwprSeasonPrem release], cwprSeasonPrem = nil;
    [cwprMonthPrem release], cwprMonthPrem = nil;
    [kwprYearPrem release], kwprYearPrem = nil;
    [kwprHalfPrem release], kwprHalfPrem = nil;
    [kwprSeasonPrem release], kwprSeasonPrem = nil;
    [kwprMonthPrem release], kwprMonthPrem = nil;
    [specFee release], specFee = nil;
    [occuFee release], occuFee = nil;
    [fixFee release], fixFee = nil;
    [totalFixFee release], totalFixFee = nil;
    [invsTargetPrem release], invsTargetPrem = nil;
    
    [cloudId release], cloudId = nil;
    [super dealloc];
}

- (NSString*)GetCloudSQL
{
    NSString *fields = [NSString stringWithFormat:@"cloh,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,",
                        [Base64 encode:[fileName dataUsingEncoding:NSUTF8StringEncoding]],
                        planCode,
                        rateScale,
                        planAbbrCode,
                        [Base64 encode:[planDesc dataUsingEncoding:NSUTF8StringEncoding]],
                        planType,
                        relationCode,
                        declareRate,
                        faceAmt,
                        modePrem,   //10
                        socialInsurance,
                        cwprInd,
                        cwprPlan,
                        iwprInd,
                        iwprPlan,
                        bodyType,
                        invsTargetPrem,
                        firstPrem,
                        invsPrem,
                        invsDurs,    //20
                        invsRate,
                        invsFee,
                        loadingRate,
                        cityRate,
                        vaType,
                        anRate,
                        anDur,
                        anAge,
                        anPrem,
                        anPurePrem,    //30
                        accuRateList,
                        periodCertain,
                        anPayType,
                        saveInd,
                        projectType==nil?@"":projectType,
                        planAbbrOrder,
                        agentCode,
                        proposalType,
                        abbrType,
                        relationIndex,   //40
                        declareBookInd];
    return fields;
}

+ (savePlanInfo*)GetSavePlanRecordWithCloudString:(NSString*)cloudString andCloudId:(NSString*)cloudId
{
    savePlanInfo *plan = [[savePlanInfo alloc] init];
    NSArray *comp = [cloudString componentsSeparatedByString:@","];
    NSData *base64ForPlanDesc = [Base64 decode:comp[5]];
    NSData *base64ForfileName = [Base64 decode:comp[1]];
    NSString *planDesc = [[[NSString alloc] initWithData:base64ForPlanDesc encoding:NSUTF8StringEncoding] autorelease];
    NSString *fileName = [[[NSString alloc] initWithData:base64ForfileName encoding:NSUTF8StringEncoding] autorelease];
    plan.fileName = fileName;
    plan.planCode = comp[2];
    plan.rateScale = comp[3];
    plan.planAbbrCode = comp[4];
    plan.planDesc = planDesc;
    plan.planType = comp[6];
    plan.relationCode = comp[7];
    plan.declareRate = comp[8];
    plan.faceAmt = comp[9];
    plan.modePrem = comp[10];
    plan.socialInsurance = comp[11];  //11
    plan.cwprInd = comp[12];
    plan.cwprPlan = comp[13];
    plan.iwprInd = comp[14];
    plan.iwprPlan = comp[15];
    plan.bodyType = comp[16];
    plan.invsTargetPrem = comp[17];
    plan.firstPrem = comp[18];
    plan.invsPrem = comp[19];
    plan.invsDurs = comp[20];
    plan.invsRate = comp[21]; //21
    plan.invsFee = comp[22];
    plan.loadingRate = comp[23];
    plan.cityRate = comp[24];
    plan.vaType = comp[25];
    plan.anRate = comp[26];
    plan.anDur = comp[27];
    plan.anAge = comp[28];
    plan.anPrem = comp[29];
    plan.anPurePrem = comp[30];
    plan.accuRateList = [NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@", comp[31], comp[32], comp[33], comp[34], comp[35], comp[36]];  //31
    plan.periodCertain = comp[37];
    plan.anPayType = comp[38];
    plan.saveInd = comp[39];
    plan.projectType = comp[40];
    plan.planAbbrOrder = comp[41];
    plan.agentCode = comp[42],
    plan.proposalType = comp[43];
    plan.abbrType = comp[44];
    plan.relationIndex = [NSNumber numberWithInteger:[comp[45] integerValue]];
    plan.declarebookInd = comp[46];      //41
    plan.cloudId = cloudId;
    
    return [plan autorelease];
}
@end
