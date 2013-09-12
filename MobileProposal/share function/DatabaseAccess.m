//
//  DatabaseAccess.m
//  MLIproposal
//
//  Created by 張星星 on 12/2/15.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "DatabaseAccess.h"
#import "SwitchFunction.h"
#import "MathFunction.h"
#import "systemParamater.h"

DatabaseAccess *databaseAccessInstance;

@interface DatabaseAccess()

- (NSString*)makeAbbrPara:(NSArray*)aAbbrs;
- (NSString*)makePlanCodePara:(NSArray*)planArray;

- (NSString*)parseNullWithObject:(id)obj;

@end

@implementation DatabaseAccess

+ (DatabaseAccess*)databaseAccessInstance
{
    if (databaseAccessInstance == nil)
    {
        databaseAccessInstance = [[DatabaseAccess alloc] init];
    }
    return databaseAccessInstance;
}

- (void)openConnection
{
    NSString *mliPath = [[NSBundle mainBundle] pathForResource:@"mli" ofType:@"sqlite"];
    
    db = [[FMDatabase databaseWithPath:mliPath] retain];
    
    if (![db open])
    {
        NSLog(@"open mli.sqlite faild");
    }
}
- (id)init
{
    if (self = [super init])
    {
        [self openConnection];
    }
    return self;
}
#pragma mark - load from lfAbbr, lfPlanAid, lfPldf
- (NSArray*)loadAbbrWithPlantype:(NSString*)planType
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"Select * From lfAbbr Where plan_type = '%@' And abbr_type <> '9' Order by seq",planType];
    //NSLog(@"SQL:%@",strSQL);
    abbr *record;
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        /*
         NSString *planAbbrCode;
         NSString *planAbbrDesc;
         NSString *planType;
         NSString *seq;
         NSString *fbInd;
         */
        record = [[abbr alloc] init];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planAbbrDesc = [rs stringForColumn:@"planAbbr_desc"];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.seq = [NSNumber numberWithInt:[rs intForColumn:@"seq"]];
        record.fbInd = [rs stringForColumn:@"fb_ind"];
        [array addObject:record];
        [record release];
    }
    return array;
}

- (NSArray*)loadPlanAidWithPlanAbbr:(NSString*)abbrCode
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"Select * From lfPlanAid Where plan_abbr_code = '%@' group by period_order Order By plan_abbr_code,period_order, planCode_order", abbrCode];
    
    //NSLog(@"SQL:%@",strSQL);
    planAid *record;
    
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        /*
         NSString *planType;
         NSString *planAbbrCode;
         NSString *planAbbrDesc;
         NSString *periodOrder;
         NSString *periodDesc;
         NSString *planCodeOrder;
         NSString *planCodeDesc;
         NSString *IPlanCode;
         NSString *SPlanCode;
         NSString *CPlanCode;
         */
        record = [[planAid alloc] init];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planAbbrDesc = [rs stringForColumn:@"planAbbr_desc"];
        record.periodOrder = [NSNumber numberWithInt:[rs intForColumn:@"period_order"]];
        record.periodDesc = [rs stringForColumn:@"period_desc"];
        record.planCodeOrder = [NSNumber numberWithInt:[rs intForColumn:@"planCode_order"]];
        record.planCodeDesc = [rs stringForColumn:@"planCode_desc"];
        record.IPlanCode = [rs stringForColumn:@"I_planCode"];
        record.SPlanCode = [rs stringForColumn:@"S_planCode"];
        record.CPlanCode = [rs stringForColumn:@"C_planCode"];
        
        [array addObject:record];
        [record release];
    }
    return array;
}
- (NSArray*)loadPlanAidWithPlanAbbr:(NSString*)abbrCode andPeriod:(NSInteger)period
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"Select * From lfPlanAid Where plan_abbr_code = '%@' And period_order = %i Order By plan_abbr_code,period_order, planCode_order", abbrCode, period];
    
    //NSLog(@"SQL:%@",strSQL);
    planAid *record;
    
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        /*
         NSString *planType;
         NSString *planAbbrCode;
         NSString *planAbbrDesc;
         NSString *periodOrder;
         NSString *periodDesc;
         NSString *planCodeOrder;
         NSString *planCodeDesc;
         NSString *IPlanCode;
         NSString *SPlanCode;
         NSString *CPlanCode;
         */
        record = [[planAid alloc] init];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planAbbrDesc = [rs stringForColumn:@"planAbbr_desc"];
        record.periodOrder = [NSNumber numberWithInt:[rs intForColumn:@"period_order"]];
        record.periodDesc = [rs stringForColumn:@"period_desc"];
        record.planCodeOrder = [NSNumber numberWithInt:[rs intForColumn:@"planCode_order"]];
        record.planCodeDesc = [rs stringForColumn:@"planCode_desc"];
        record.IPlanCode = [rs stringForColumn:@"I_planCode"];
        record.SPlanCode = [rs stringForColumn:@"S_planCode"];
        record.CPlanCode = [rs stringForColumn:@"C_planCode"];
        [array addObject:record];
        [record release];
    }
    return array;

}

#pragma mark planAbbr
- (NSArray*)getAbbrWithProposalType:(NSString*)proposalType andAbbrType:(NSString*)abbrType andPlanType:(NSString*)planType andProjectType:(NSUInteger)projectType
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * From planAbbr Where proposal_type = '%@' And plan_type = '%@' And abbr_type = '%@' And abbr_type <> '9' Order by seq",proposalType, planType, abbrType];
    //利變年金 & 一萬元專案 無險種
    //NSLog(@"SQL:%@",strSQL);
    /*
     新增 投資型限制、內勤限制
     1.內勤限制
     2.投資型
     3.外幣
     */
    //目前只有HVA有此限制
    if ([proposalType isEqualToString:proposalType_hva])
    {
        strSQL = [NSString stringWithFormat:@"select * From planAbbr Where proposal_type = '%@' And (plan_type = '%@' or plan_type = 'L') And (abbr_type = '%@' or abbr_type = '1') And abbr_type <> '9' Order by seq",proposalType, planType, abbrType];
    }
    abbr *record;
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        record = [[abbr alloc] init];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planAbbrDesc = [rs stringForColumn:@"planAbbr_desc"];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.seq = [NSNumber numberWithInt:[rs intForColumn:@"seq"]];
        record.fbInd = [rs stringForColumn:@"fb_ind"];
        [array addObject:record];
        [record release];
    }
    return array;
}
#pragma mark planAid
- (NSArray*)getPlanAidWithPlanAbbr:(NSString*)planAbbr
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"Select * From planAid Where plan_abbr_code = '%@' group by period_order Order By plan_abbr_code,period_order desc, planCode_order", planAbbr];
    
    //NSLog(@"SQL:%@",strSQL);
    planAid *record;
    
    FMResultSet *rs = [[DatabaseFunction GetdataDB] executeQuery:strSQL];
    while ([rs next])
    {
        record = [[planAid alloc] init];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planAbbrDesc = [rs stringForColumn:@"planAbbr_desc"];
        record.periodOrder = [NSNumber numberWithInt:[rs intForColumn:@"period_order"]];
        record.periodDesc = [rs stringForColumn:@"period_desc"];
        record.planCodeOrder = [NSNumber numberWithInt:[rs intForColumn:@"planCode_order"]];
        record.planCodeDesc = [rs stringForColumn:@"planCode_desc"];
        record.IPlanCode = [rs stringForColumn:@"I_planCode"];
        record.SPlanCode = [rs stringForColumn:@"S_planCode"];
        record.CPlanCode = [rs stringForColumn:@"C_planCode"];
        record.proposalType = [rs stringForColumn:@"proposal_type"];
        [array addObject:record];
        [record release];
    }
    return array;
}
- (NSArray*)getPlanAidWithPlanAbbr:(NSString*)planAbbr andPeriod:(NSNumber*)period
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"Select * From planAid Where plan_abbr_code = '%@' And period_order = %i Order By plan_abbr_code,period_order desc, planCode_order", planAbbr, [period integerValue]];
    
    //NSLog(@"SQL:%@",strSQL);
    planAid *record;
    
    FMResultSet *rs = [[DatabaseFunction GetdataDB] executeQuery:strSQL];
    while ([rs next])
    {
        record = [[planAid alloc] init];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planAbbrDesc = [rs stringForColumn:@"planAbbr_desc"];
        record.periodOrder = [NSNumber numberWithInt:[rs intForColumn:@"period_order"]];
        record.periodDesc = [rs stringForColumn:@"period_desc"];
        record.planCodeOrder = [NSNumber numberWithInt:[rs intForColumn:@"planCode_order"]];
        record.planCodeDesc = [rs stringForColumn:@"planCode_desc"];
        record.IPlanCode = [rs stringForColumn:@"I_planCode"];
        record.SPlanCode = [rs stringForColumn:@"S_planCode"];
        record.CPlanCode = [rs stringForColumn:@"C_planCode"];
        record.proposalType = [rs stringForColumn:@"proposal_type"];
        [array addObject:record];
        [record release];
    }
    return array;
}
#pragma mark - lfPldf
- (pldf*)getLfPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType
{
    NSString *strSQL = [NSString stringWithFormat:@"Select * From pldf Where plan_code = '%@' Order by rate_scale desc",planCode];
    pldf *record = [[pldf alloc] init];
    //NSLog(@"db:%@",strSQL);
    FMResultSet *rs = [[DatabaseFunction GetdataDB] executeQuery:strSQL];
    if ([rs next])
    {
        record.planCode = [rs stringForColumn:@"plan_code"];
        record.rateScale = [rs stringForColumn:@"rate_scale"];
        record.planDesc = [rs stringForColumn:@"plan_desc"];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planCloseDate = [rs stringForColumn:@"plan_close_date"];
        record.insurableAgeHigh = [NSNumber numberWithInt:[rs intForColumn:@"insurable_age_high"]];
        record.insurableAgeLow = [NSNumber numberWithInt:[rs intForColumn:@"insurable_age_low"]];
        //record.planObjArray = [rs stringForColumn:@"plan_obj_array"];
        //record.planTermInd = [rs stringForColumn:@"plan_term_ind"];
        record.faceAmtType = [rs stringForColumn:@"face_amt_type"];
        record.faceAmtMaxi = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_maxi"]];
        record.faceAmtMini = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_mini"]];
        //record.faceAmtChdMaxi = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_chd_maxi"]];
        record.unitValueInd = [rs stringForColumn:@"unit_value_ind"];
        record.unitValue = [NSNumber numberWithInt:[rs intForColumn:@"unit_value"]];
        record.coverageYearAge = [NSNumber numberWithInt:[rs intForColumn:@"coverage_year_age"]];
        record.coverageYearDur = [NSNumber numberWithInt:[rs intForColumn:@"coverage_year_dur"]];
        record.premiumYearDur = [NSNumber numberWithInt:[rs intForColumn:@"premium_year_dur"]];
        record.premiumYearAge = [NSNumber numberWithInt:[rs intForColumn:@"premium_year_age"]];
        //record.modeInd = [rs stringForColumn:@"mode_ind"];
        record.premCalcType = [rs stringForColumn:@"prem_calc_type"];
        record.premRateInd = [rs stringForColumn:@"prem_rate_ind"];
        record.ratePlanCode = [rs stringForColumn:@"rate_plan_code"];
        record.rateRateScale = [rs stringForColumn:@"rate_rate_scale"];
        record.rateAgeInd = [rs stringForColumn:@"rate_age_ind"];
        record.rateDurInd = [rs stringForColumn:@"rate_dur_ind"];
        record.rateSexInd = [rs stringForColumn:@"rate_sex_ind"];
        record.rateMediInd = [rs stringForColumn:@"rate_medi_ind"];
        record.rateOccuInd = [rs stringForColumn:@"rate_occu_ind"];
        record.rateInsuInd = [rs stringForColumn:@"rate_insu_ind"];
        //record.rateSubInd_1 = [rs stringForColumn:@"rate_sub_ind_1"];
        //record.rateSubInd_2 = [rs stringForColumn:@"rate_sub_ind_2"];
        record.wpInd = [rs stringForColumn:@"wp_ind"];
        record.primaryRiderInd = [rs stringForColumn:@"primary_rider_ind"];
        //record.renewableAge = [NSNumber numberWithInt:[rs intForColumn:@"renewable_age"]];
        record.saPlanCode = [rs stringForColumn:@"sa_plan_code"];
        record.saRateScale = [rs stringForColumn:@"sa_rate_scale"];
        //record.saAgeInd = [rs stringForColumn:@"sa_age_ind"];
        record.prPlanCode = [rs stringForColumn:@"pr_plan_code"];
        record.prRateScale = [rs stringForColumn:@"pr_rate_scale"];
        record.rpuInd = [rs stringForColumn:@"rpu_ind"];
        //record.etiInd = [rs stringForColumn:@"eti_ind"];
        //record.etiMethod = [rs stringForColumn:@"eti_method"];
        record.cvType = [rs stringForColumn:@"cv_type"];
        record.commPlanCode = [rs stringForColumn:@"comm_plan_code"];
        record.commRateScale = [rs stringForColumn:@"comm_rate_scale"];
        //record.groupDiscInd = [rs stringForColumn:@"group_disc_ind"];
        record.hratExist = [rs stringForColumn:@"hrat_exist"];
        record.cpExist = [rs stringForColumn:@"cp_exist"];
        record.cvExist = [rs stringForColumn:@"cv_exist"];
        record.pvExist = [rs stringForColumn:@"pv_exist"];
        //record.ratingInd = [rs stringForColumn:@"rating_ind"];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.planAbbrOrder = [NSNumber numberWithInt:[rs intForColumn:@"planAbbr_order"]];
        record.periodOrder = [NSNumber numberWithInt:[rs intForColumn:@"period_order"]];
        record.periodDesc = [rs stringForColumn:@"period_desc"];
        record.planCodeOrder = [NSNumber numberWithInt:[rs intForColumn:@"planCode_order"]];
        record.planCodeDesc = [rs stringForColumn:@"planCode_desc"];
        record.pricingIx = [NSNumber numberWithDouble:[rs doubleForColumn:@"pricing_ix"]];
        record.divInd = [rs stringForColumn:@"div_ind"];
        record.currency = [rs stringForColumn:@"currency"];
        NSString *strSQL2 = [NSString stringWithFormat:@"select pricing_qx, pricing_qx_perc from lfRpuInd where plan_code = '%@'", record.planCode];
        FMResultSet *rpuRs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL2];
        if ([rpuRs next])
        {
            record.pricingQx = [rpuRs stringForColumn:@"pricing_qx"];
            record.pricingQxPerc = [NSNumber numberWithInteger:[rpuRs intForColumn:@"pricing_qx_perc"]];
        }
    }
    return record;
}

#pragma mark invsPldf
- (pldf*)getInvsPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType
{
    pldf *record = [[[pldf alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"Select * From pldf Where plan_code = '%@' Order by rate_scale desc",planCode];
    //NSLog(@"db:%@",strSQL);
    FMResultSet *rs = [[DatabaseFunction GetdataDB] executeQuery:strSQL];
    if ([rs next])
    {
        record.planCode = [rs stringForColumn:@"plan_code"];
        record.rateScale = [rs stringForColumn:@"rate_scale"];
        record.planDesc = [rs stringForColumn:@"plan_desc"];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planClassCode = [rs stringForColumn:@"plan_class_code"];
        record.planCloseDate = [rs stringForColumn:@"plan_close_date"];
        record.insurableAgeHigh = [NSNumber numberWithInt:[rs intForColumn:@"insurable_age_high"]];
        record.insurableAgeLow = [NSNumber numberWithInt:[rs intForColumn:@"insurable_age_low"]];
        record.faceAmtType = [rs stringForColumn:@"face_amt_type"];
        record.faceAmtMaxi = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_maxi"]];
        record.faceAmtMini = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_mini"]];
        record.unitValueInd = [rs stringForColumn:@"unit_value_ind"];
        record.unitValue = [NSNumber numberWithInt:[rs intForColumn:@"unit_value"]];
        record.coverageYearAge = [NSNumber numberWithInt:[rs intForColumn:@"coverage_year_age"]];
        record.coverageYearDur = [NSNumber numberWithInt:[rs intForColumn:@"coverage_year_dur"]];
        record.premiumYearDur = [NSNumber numberWithInt:[rs intForColumn:@"premium_year_dur"]];
        record.premiumYearAge = [NSNumber numberWithInt:[rs intForColumn:@"premium_year_age"]];
        record.premCalcType = [rs stringForColumn:@"prem_calc_type"];
        record.premRateInd = [rs stringForColumn:@"prem_rate_ind"];
        record.ratePlanCode = [rs stringForColumn:@"rate_plan_code"];
        record.rateRateScale = [rs stringForColumn:@"rate_rate_scale"];
        record.rateAgeInd = [rs stringForColumn:@"rate_age_ind"];
        record.rateDurInd = [rs stringForColumn:@"rate_dur_ind"];
        record.rateSexInd = [rs stringForColumn:@"rate_sex_ind"];
        record.rateMediInd = [rs stringForColumn:@"rate_medi_ind"];
        record.rateOccuInd = [rs stringForColumn:@"rate_occu_ind"];
        record.rateInsuInd = [rs stringForColumn:@"rate_insu_ind"];
        record.primaryRiderInd = [rs stringForColumn:@"primary_rider_ind"];
        record.commPlanCode = [rs stringForColumn:@"comm_plan_code"];
        record.commRateScale = [rs stringForColumn:@"comm_rate_scale"];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.planAbbrOrder = [NSNumber numberWithInt:[rs intForColumn:@"planAbbr_order"]];
        record.periodOrder = [NSNumber numberWithInt:[rs intForColumn:@"period_order"]];
        record.periodDesc = [rs stringForColumn:@"period_desc"];
        record.planCodeOrder = [NSNumber numberWithInt:[rs intForColumn:@"planCode_order"]];
        record.planCodeDesc = [rs stringForColumn:@"planCode_desc"];
        record.pricingIx = [NSNumber numberWithDouble:[rs doubleForColumn:@"pricing_ix"]];
        record.currency = [rs stringForColumn:@"currency"];
        record.pricingQx = [rs stringForColumn:@"pricing_qx"];
        record.pricingQxPerc = [NSNumber numberWithDouble:[rs doubleForColumn:@"pricing_qx_perc"]];
        record.expnPtr = [rs stringForColumn:@"expn_ptr"];
        record.feldPtr = [rs stringForColumn:@"feld_ptr"];
        record.coiAgeInd = [rs stringForColumn:@"coi_age_ind"];
        record.coiSexInd = [rs stringForColumn:@"coi_sex_ind"];
        record.loadingPlanCode = [rs stringForColumn:@"loading_plan_code"];
        record.loadingRateScale = [rs stringForColumn:@"loading_rate_scale"];
    }
    return record;
}

#pragma mark ulPldf
- (pldf*)getUlPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType
{
    pldf *record = [[[pldf alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"Select * From pldf Where plan_code = '%@' Order by rate_scale desc",planCode];
    //NSLog(@"db:%@",strSQL);
    FMResultSet *rs = [[DatabaseFunction GetdataDB] executeQuery:strSQL];
    if ([rs next])
    {
        record.planCode = [rs stringForColumn:@"plan_code"];
        record.rateScale = [rs stringForColumn:@"rate_scale"];
        record.planDesc = [rs stringForColumn:@"plan_desc"];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planClassCode = [rs stringForColumn:@"plan_class_code"];
        record.planCloseDate = [rs stringForColumn:@"plan_close_date"];
        record.insurableAgeHigh = [NSNumber numberWithInt:[rs intForColumn:@"insurable_age_high"]];
        record.insurableAgeLow = [NSNumber numberWithInt:[rs intForColumn:@"insurable_age_low"]];
        record.faceAmtType = [rs stringForColumn:@"face_amt_type"];
        record.faceAmtMaxi = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_maxi"]];
        record.faceAmtMini = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_mini"]];
        record.unitValueInd = [rs stringForColumn:@"unit_value_ind"];
        record.unitValue = [NSNumber numberWithInt:[rs intForColumn:@"unit_value"]];
        record.coverageYearAge = [NSNumber numberWithInt:[rs intForColumn:@"coverage_year_age"]];
        record.coverageYearDur = [NSNumber numberWithInt:[rs intForColumn:@"coverage_year_dur"]];
        record.premiumYearDur = [NSNumber numberWithInt:[rs intForColumn:@"premium_year_dur"]];
        record.premiumYearAge = [NSNumber numberWithInt:[rs intForColumn:@"premium_year_age"]];
        record.premCalcType = [rs stringForColumn:@"prem_calc_type"];
        record.premRateInd = [rs stringForColumn:@"prem_rate_ind"];
        record.ratePlanCode = [rs stringForColumn:@"rate_plan_code"];
        record.rateRateScale = [rs stringForColumn:@"rate_rate_scale"];
        record.rateAgeInd = [rs stringForColumn:@"rate_age_ind"];
        record.rateDurInd = [rs stringForColumn:@"rate_dur_ind"];
        record.rateSexInd = [rs stringForColumn:@"rate_sex_ind"];
        record.rateMediInd = [rs stringForColumn:@"rate_medi_ind"];
        record.rateOccuInd = [rs stringForColumn:@"rate_occu_ind"];
        record.rateInsuInd = [rs stringForColumn:@"rate_insu_ind"];
        record.primaryRiderInd = [rs stringForColumn:@"primary_rider_ind"];
        record.commPlanCode = [rs stringForColumn:@"comm_plan_code"];
        record.commRateScale = [rs stringForColumn:@"comm_rate_scale"];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.planAbbrOrder = [NSNumber numberWithInt:[rs intForColumn:@"planAbbr_order"]];
        record.periodOrder = [NSNumber numberWithInt:[rs intForColumn:@"period_order"]];
        record.periodDesc = [rs stringForColumn:@"period_desc"];
        record.planCodeOrder = [NSNumber numberWithInt:[rs intForColumn:@"planCode_order"]];
        record.planCodeDesc = [rs stringForColumn:@"planCode_desc"];
        record.pricingIx = [NSNumber numberWithDouble:[rs doubleForColumn:@"pricing_ix"]];
        record.currency = [rs stringForColumn:@"currency"];
        record.pricingQx = [rs stringForColumn:@"pricing_qx"];
        record.pricingQxPerc = [NSNumber numberWithDouble:[rs doubleForColumn:@"pricing_qx_perc"]];
        record.expnPtr = [rs stringForColumn:@"expn_ptr"];
        record.feldPtr = [rs stringForColumn:@"feld_ptr"];
        record.coiAgeInd = [rs stringForColumn:@"coi_age_ind"];
        record.coiSexInd = [rs stringForColumn:@"coi_sex_ind"];
        record.loadingPlanCode = [rs stringForColumn:@"loading_plan_code"];
        record.loadingRateScale = [rs stringForColumn:@"loading_rate_scale"];
        record.iRateRaisePtr = [rs stringForColumn:@"i_rate_raise_ptr"];
    }
    return record;
}

- (vlPrat*)getVlPratWithPlanCode:(NSString*)planCode andCustomerInfo:(customerInfo*)customer
{
    vlPrat *prat = [[vlPrat alloc] init];
    NSString *strSQL = [NSString stringWithFormat:@"select * from vlPrat where plan_code = '%@' and rate_age = %@ and rate_sex = '%@'",
                        planCode, customer.age, customer.sex];
    FMResultSet *rs = [[DatabaseFunction GetInvsRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        prat.planCode = [rs stringForColumn:@"plan_code"];
        prat.rateScale = [rs stringForColumn:@"rate_scale"];
        prat.rateAge = [NSNumber numberWithInteger:[rs intForColumn:@"rate_age"]];
        prat.rateSex = [rs stringForColumn:@"rate_sex"];
        prat.premFactor = [NSNumber numberWithDouble:[rs doubleForColumn:@"prem_factor"]];
    }
    return prat;
}

- (vlPrat*)getVlPratWithPlanCode:(NSString *)planCode andCustomerInfo:(customerInfo *)customer andBodyType:(NSString*)bodyType
{
    vlPrat *prat = [[vlPrat alloc] init];
    NSString *strSQL = [NSString stringWithFormat:@"select * from vlPrat where plan_code = '%@' and rate_age = %@ and rate_sex = '%@' and rate_medi = '%@'",
                        planCode, customer.age, customer.sex, bodyType];
    FMResultSet *rs = [[DatabaseFunction GetInvsRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        prat.planCode = [rs stringForColumn:@"plan_code"];
        prat.rateScale = [rs stringForColumn:@"rate_scale"];
        prat.rateAge = [NSNumber numberWithInteger:[rs intForColumn:@"rate_age"]];
        prat.rateSex = [rs stringForColumn:@"rate_sex"];
        prat.premFactor = [NSNumber numberWithDouble:[rs doubleForColumn:@"prem_factor"]];
    }
    return prat;
}

- (ulPrat*)getUlPratWithPlanCode:(NSString*)planCode andCustomerInfo:(customerInfo*)customer
{
    ulPrat *prat = [[ulPrat alloc] init];
    NSString *strSQL = [NSString stringWithFormat:@"select * from ulPrat where plan_code = '%@' and rate_age = %@ and rate_sex = '%@'",
                        planCode, customer.age, customer.sex];
    FMResultSet *rs = [[DatabaseFunction GetInvsRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        prat.planCode = [rs stringForColumn:@"plan_code"];
        prat.rateScale = [rs stringForColumn:@"rate_scale"];
        prat.rateAge = [NSNumber numberWithInteger:[rs intForColumn:@"rate_age"]];
        prat.rateDur = [NSNumber numberWithInteger:[rs intForColumn:@"rate_dur"]];
        prat.rateSex = [rs stringForColumn:@"rate_sex"];
        prat.rateOccu = [rs stringForColumn:@"rate_occu"];
        prat.rateInsu = [rs stringForColumn:@"rate_insu"];
        prat.rateUnit = [rs stringForColumn:@"rate_unit"];
        prat.premFactor = [NSNumber numberWithDouble:[rs doubleForColumn:@"prem_factor"]];
    }
    return prat;
}

#pragma mark tgsaRange
- (tgsaRange*)getTgsaRangeWithPlanCode:(NSString*)planCode andSex:(NSString*)sex andAge:(NSInteger)age
{
    tgsaRange *tgsaRecord = nil;
    NSString *strSQL = [NSString stringWithFormat:@"Select * From tgsaRange Where plan_code = '%@' and rate_sex = '%@' and rate_age = '%i'",planCode, sex, age];
    FMResultSet *rs = [[DatabaseFunction GetInvsRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        tgsaRecord = [[tgsaRange alloc] init];
        tgsaRecord.planCode = [rs stringForColumn:@"plan_code"];
        tgsaRecord.rateScale = [rs stringForColumn:@"rate_scale"];
        tgsaRecord.rateSex = [rs stringForColumn:@"rate_sex"];
        tgsaRecord.rateAge = [NSNumber numberWithInt:[rs intForColumn:@"rate_age"]];
        tgsaRecord.minRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"min_rate"]];
        tgsaRecord.maxRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"max_rate"]];
    }
    return tgsaRecord;
}

- (invsArep*)getInvsArepWithPlanCode:(NSString*)planCode andCustomer:(customerInfo*)customer
{
    invsArep *arep = [[invsArep alloc] init];
    NSString *strSQL = [NSString stringWithFormat:@"select * from InvsArep where plan_code = '%@' and rate_age = %@ and rate_sex = '%@'",
                        planCode, customer.age, customer.sex];
    FMResultSet *rs = [[DatabaseFunction GetInvsRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        arep.planCode = [rs stringForColumn:@"plan_code"];
        arep.rateScale = [rs stringForColumn:@"rate_scale"];
        arep.rateAge = [NSNumber numberWithInteger:[rs intForColumn:@"rate_age"]];
        arep.rateSex = [rs stringForColumn:@"rate_sex"];
        arep.fee = [NSNumber numberWithDouble:[rs doubleForColumn:@"rating_rate_lf"]];
    }
    return arep;
}

- (invsRule*)getInvsRuleWithPlanType:(NSString*)planType andCustomer:(customerInfo*)customer
{
    invsRule *rule = [[invsRule alloc] init];
    NSString *strSQL = [NSString stringWithFormat:@"select * from InvsRule Where plan_type = '%@' and %@ between start and end",planType, customer.age];
    FMResultSet *rs = [[DatabaseFunction GetInvsRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        rule.planType = [rs stringForColumn:@"plan_type"];
        rule.start = [NSNumber numberWithInteger:[rs intForColumn:@"start"]];
        rule.end = [NSNumber numberWithInteger:[rs intForColumn:@"end"]];
        rule.factor = [NSNumber numberWithDouble:[rs doubleForColumn:@"factor"]];
    }
    return rule;
}

- (NSArray*)getCoiWithPlanCode:(NSString*)planCode andCustomer:(customerInfo*)customer
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from InvsCoi where plan_code = '%@' and sex = '%@' and rate_medi = '%@'",planCode, customer.sex, customer.bodyType];
    FMResultSet *rs = [[DatabaseFunction GetInvsRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        invsCoi *coi = [[invsCoi alloc] init];
        coi.planCode = [rs stringForColumn:@"plan_code"];
        coi.rateScale = [rs stringForColumn:@"rate_sclae"];
        coi.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        coi.ageDur = [NSNumber numberWithInteger:[rs intForColumn:@"age"]];
        coi.sex = [rs stringForColumn:@"sex"];
        coi.rateMedi = [rs stringForColumn:@"rate_medi"];
        coi.rateOccu = [rs stringForColumn:@"rate_occu"];
        coi.coiFactor = [NSNumber numberWithDouble:[rs doubleForColumn:@"coi_factor"]];
        [array addObject:coi];
        [coi release];
    }
    return array;
}

#pragma mark invsFdlf
- (NSArray*)getFdlfWithFeldPtr:(NSString*)feldPtr
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from InvsFdlf where feld_ptr = '%@'", feldPtr];
    FMResultSet *rs = [[DatabaseFunction GetInvsRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        invsFdlf *fdlf = [[invsFdlf alloc] init];
        fdlf.feldPtr = [rs stringForColumn:@"feld_ptr"];
        fdlf.feldType = [rs stringForColumn:@"feld_type"];
        fdlf.expnReasonCode = [rs stringForColumn:@"expn_reason_code"];
        fdlf.poYearFrom = [NSNumber numberWithInteger:[rs intForColumn:@"po_year_from"]];
        fdlf.poYearTo = [NSNumber numberWithInteger:[rs intForColumn:@"po_year_to"]];
        fdlf.feldCalcInd  = [rs stringForColumn:@"feld_calc_ind"];
        fdlf.feldCalcRef = [NSNumber numberWithDouble:[rs doubleForColumn:@"feld_calc_ref"]];
        fdlf.feldBaseInd = [rs stringForColumn:@"feld_base_ind"];
        [array addObject:fdlf];
        [fdlf release];
    }
    return array;
}

#pragma mark invsVcrdri
- (NSArray*)getVcrdriWithExpnPtr:(NSString*)expnPtr
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from InvsVcrdri where plan_code = '%@'",expnPtr];
    FMResultSet *rs = [[DatabaseFunction GetInvsRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        invsVcrdri *vcrdri = [[invsVcrdri alloc] init];
        vcrdri.planCode = [rs stringForColumn:@"plan_code"];
        vcrdri.rateScale = [rs stringForColumn:@"rate_scale"];
        vcrdri.start = [NSNumber numberWithInteger:[rs intForColumn:@"start"]];
        vcrdri.end = [NSNumber numberWithInteger:[rs intForColumn:@"end"]];
        vcrdri.factorRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"factor_rate"]];
        [array addObject:vcrdri];
        [vcrdri release];
    }
    return array;
}
#pragma mrak Vrfdf
- (NSArray*)getVrfdfWithExpnPtr:(NSString*)expnPtr
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from vlVrfdf where feld_ptr = '%@'",expnPtr];
    FMResultSet *rs = [[DatabaseFunction GetInvsRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        invsVrfdf *vrfdf = [[invsVrfdf alloc] init];
        vrfdf.feldPtr = [rs stringForColumn:@"feld_ptr"];
        vrfdf.poYearFrom = [NSNumber numberWithInteger:[rs intForColumn:@"po_year_from"]];
        vrfdf.poYearTo = [NSNumber numberWithInteger:[rs intForColumn:@"po_year_to"]];
        vrfdf.valueRefundPerc = [NSNumber numberWithDouble:[rs doubleForColumn:@"value_refund_perc"]];
        [array addObject:vrfdf];
        [vrfdf release];
    }
    return array;
}

- (NSArray*)getViradWithInvsCode:(NSString*)iRateRaisePtr
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from ulVirad where invs_code = '%@'", iRateRaisePtr];
    FMResultSet *rs = [[DatabaseFunction GetInvsRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        ulVirad *virad = [[ulVirad alloc] init];
        virad.invsCode = [rs stringForColumn:@"invs_code"];
        virad.poYearFrom = [NSNumber numberWithInteger:[rs intForColumn:@"po_year_from"]];
        virad.poYearTo = [NSNumber numberWithInteger:[rs intForColumn:@"po_year_to"]];
        virad.viradIndAdd = [NSNumber numberWithInteger:[rs intForColumn:@"virad_int_add"]];
        [array addObject:virad];
        [virad release];
    }
    return array;
}

- (invsTargetRule*)getInvsTargetRuleWithPlanCode:(NSString*)planCode andInvsTargetPrem:(NSNumber*)targetPrem
{
    invsTargetRule *targetRule = [[invsTargetRule alloc] init];
    NSString *strSQL = [NSString stringWithFormat:@"select * from InvsTargetRule  where plan_abbr_code = '%@' and %@ between min_target and max_target", planCode, targetPrem];
    FMResultSet *rs = [[DatabaseFunction GetInvsRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        targetRule.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        targetRule.minTarget = [NSNumber numberWithDouble:[rs doubleForColumn:@"min_target"]];
        targetRule.maxTarget = [NSNumber numberWithDouble:[rs doubleForColumn:@"max_target"]];
        targetRule.ratePlanCode = [rs stringForColumn:@"rate_plan_code"];
    }
    return [targetRule autorelease];
}

#pragma mark hvaPldf
- (pldf*)getHvaPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType
{
    pldf *record = [[[pldf alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"Select * From pldf Where plan_code = '%@' Order by rate_scale desc",planCode];
    //NSLog(@"db:%@",strSQL);
    FMResultSet *rs = [[DatabaseFunction GetdataDB] executeQuery:strSQL];
    if ([rs next])
    {
        record.planCode = [rs stringForColumn:@"plan_code"];
        record.rateScale = [rs stringForColumn:@"rate_scale"];
        record.planDesc = [rs stringForColumn:@"plan_desc"];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planCloseDate = [rs stringForColumn:@"plan_close_date"];
        record.insurableAgeHigh = [NSNumber numberWithInt:[rs intForColumn:@"insurable_age_high"]];
        record.insurableAgeLow = [NSNumber numberWithInt:[rs intForColumn:@"insurable_age_low"]];
        record.faceAmtType = [rs stringForColumn:@"face_amt_type"];
        record.faceAmtMaxi = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_maxi"]];
        record.faceAmtMini = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_mini"]];
        record.unitValueInd = [rs stringForColumn:@"unit_value_ind"];
        record.unitValue = [NSNumber numberWithInt:[rs intForColumn:@"unit_value"]];
        record.coverageYearAge = [NSNumber numberWithInt:[rs intForColumn:@"coverage_year_age"]];
        record.coverageYearDur = [NSNumber numberWithInt:[rs intForColumn:@"coverage_year_dur"]];
        record.premiumYearDur = [NSNumber numberWithInt:[rs intForColumn:@"premium_year_dur"]];
        record.premiumYearAge = [NSNumber numberWithInt:[rs intForColumn:@"premium_year_age"]];
        record.premCalcType = [rs stringForColumn:@"prem_calc_type"];
        record.premRateInd = [rs stringForColumn:@"prem_rate_ind"];
        record.ratePlanCode = [rs stringForColumn:@"rate_plan_code"];
        record.rateRateScale = [rs stringForColumn:@"rate_rate_scale"];
        record.rateAgeInd = [rs stringForColumn:@"rate_age_ind"];
        record.rateDurInd = [rs stringForColumn:@"rate_dur_ind"];
        record.rateSexInd = [rs stringForColumn:@"rate_sex_ind"];
        record.rateMediInd = [rs stringForColumn:@"rate_medi_ind"];
        record.rateOccuInd = [rs stringForColumn:@"rate_occu_ind"];
        record.rateInsuInd = [rs stringForColumn:@"rate_insu_ind"];
        record.wpInd = [rs stringForColumn:@"wp_ind"];
        record.primaryRiderInd = [rs stringForColumn:@"primary_rider_ind"];
        record.saPlanCode = [rs stringForColumn:@"sa_plan_code"];
        record.saRateScale = [rs stringForColumn:@"sa_rate_scale"];
        record.prPlanCode = [rs stringForColumn:@"pr_plan_code"];
        record.prRateScale = [rs stringForColumn:@"pr_rate_scale"];
        record.rpuInd = [rs stringForColumn:@"rpu_ind"];
        record.cvType = [rs stringForColumn:@"cv_type"];
        record.commPlanCode = [rs stringForColumn:@"comm_plan_code"];
        record.commRateScale = [rs stringForColumn:@"comm_rate_scale"];
        record.cpExist = [rs stringForColumn:@"cp_exist"];
        record.cvExist = [rs stringForColumn:@"cv_exist"];
        record.pvExist = [rs stringForColumn:@"pv_exist"];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.planAbbrOrder = [NSNumber numberWithInt:[rs intForColumn:@"planAbbr_order"]];
        record.periodOrder = [NSNumber numberWithInt:[rs intForColumn:@"period_order"]];
        record.periodDesc = [rs stringForColumn:@"period_desc"];
        record.currency = [rs stringForColumn:@"currency"];
        record.promiseRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"promise_rate"]];
        record.attendRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"attend_rate"]];
        record.firstRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"first_rate"]];
        record.baseRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"base_rate"]];
        record.stdRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"std_rate"]];
        record.liborRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"libor_rate"]];
        record.calcuType = [rs stringForColumn:@"calcu_type"];
        record.modx = [NSNumber numberWithInt:[rs intForColumn:@"modx"]];
    }
    return record;
}

#pragma mark vaPldf
- (pldf*)getVaPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType
{
    pldf *record = [[[pldf alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"Select * From vaPldf Where plan_code = '%@' Order by rate_scale desc",planCode];
    //NSLog(@"db:%@",strSQL);
    FMResultSet *rs = [[DatabaseFunction GetVaDB] executeQuery:strSQL];
    if ([rs next])
    {
        record.planCode = [rs stringForColumn:@"plan_code"];
        record.rateScale = [rs stringForColumn:@"rate_scale"];
        record.planDesc = [rs stringForColumn:@"plan_desc"];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planCloseDate = [rs stringForColumn:@"plan_close_date"];
        record.insurableAgeHigh = [NSNumber numberWithInt:[rs intForColumn:@"insurable_age_high"]];
        record.insurableAgeLow = [NSNumber numberWithInt:[rs intForColumn:@"insurable_age_low"]];
        record.faceAmtType = [rs stringForColumn:@"face_amt_type"];
        record.faceAmtMaxi = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_maxi"]];
        record.faceAmtMini = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_mini"]];
        record.unitValueInd = [rs stringForColumn:@"unit_value_ind"];
        record.unitValue = [NSNumber numberWithInt:[rs intForColumn:@"unit_value"]];
        record.coverageYearAge = [NSNumber numberWithInt:[rs intForColumn:@"coverage_year_age"]];
        record.coverageYearDur = [NSNumber numberWithInt:[rs intForColumn:@"coverage_year_dur"]];
        record.premiumYearDur = [NSNumber numberWithInt:[rs intForColumn:@"premium_year_dur"]];
        record.premiumYearAge = [NSNumber numberWithInt:[rs intForColumn:@"premium_year_age"]];
        record.premCalcType = [rs stringForColumn:@"prem_calc_type"];
        record.premRateInd = [rs stringForColumn:@"prem_rate_ind"];
        record.ratePlanCode = [rs stringForColumn:@"rate_plan_code"];
        record.rateRateScale = [rs stringForColumn:@"rate_rate_scale"];
        record.rateAgeInd = [rs stringForColumn:@"rate_age_ind"];
        record.rateDurInd = [rs stringForColumn:@"rate_dur_ind"];
        record.rateSexInd = [rs stringForColumn:@"rate_sex_ind"];
        record.rateMediInd = [rs stringForColumn:@"rate_medi_ind"];
        record.rateOccuInd = [rs stringForColumn:@"rate_occu_ind"];
        record.rateInsuInd = [rs stringForColumn:@"rate_insu_ind"];
        record.wpInd = [rs stringForColumn:@"wp_ind"];
        record.primaryRiderInd = [rs stringForColumn:@"primary_rider_ind"];
        record.saPlanCode = [rs stringForColumn:@"sa_plan_code"];
        record.saRateScale = [rs stringForColumn:@"sa_rate_scale"];
        record.prPlanCode = [rs stringForColumn:@"pr_plan_code"];
        record.prRateScale = [rs stringForColumn:@"pr_rate_scale"];
        record.rpuInd = [rs stringForColumn:@"rpu_ind"];
        record.cvType = [rs stringForColumn:@"cv_type"];
        record.commPlanCode = [rs stringForColumn:@"comm_plan_code"];
        record.commRateScale = [rs stringForColumn:@"comm_rate_scale"];
        record.hratExist = [rs stringForColumn:@"hrat_exist"];
        record.cpExist = [rs stringForColumn:@"cp_exist"];
        record.cvExist = [rs stringForColumn:@"cv_exist"];
        record.pvExist = [rs stringForColumn:@"pv_exist"];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.planAbbrOrder = [NSNumber numberWithInt:[rs intForColumn:@"planAbbr_order"]];
        record.periodOrder = [NSNumber numberWithInt:[rs intForColumn:@"period_order"]];
        record.periodDesc = [rs stringForColumn:@"period_desc"];
        record.planCodeOrder = [NSNumber numberWithInt:[rs intForColumn:@"planCode_order"]];
        record.planCodeDesc = [rs stringForColumn:@"planCode_desc"];
        record.pricingIx = [NSNumber numberWithDouble:[rs doubleForColumn:@"pricing_ix"]];
        record.currency = [rs stringForColumn:@"currency"];
        record.promiseRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"promise_rate"]];
        record.attendRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"attend_rate"]];
        record.firstRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"first_rate"]];
        record.baseRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"base_rate"]];
        record.stdRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"std_rate"]];
        record.liborRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"libor_rate"]];
        record.calcuType = [rs stringForColumn:@"calcu_type"];
        record.modx = [NSNumber numberWithInt:[rs intForColumn:@"modx"]];
    }
    return record;
}

#pragma mark cnPldf
- (pldf*)getCnPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType
{
    pldf *record = [[[pldf alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"Select * From vaPldf Where plan_code = '%@' Order by rate_scale desc",planCode];
    //NSLog(@"db:%@",strSQL);
    FMResultSet *rs = [[DatabaseFunction GetVaDB] executeQuery:strSQL];
    if ([rs next])
    {
        record.planCode = [rs stringForColumn:@"plan_code"];
        record.rateScale = [rs stringForColumn:@"rate_scale"];
        record.planDesc = [rs stringForColumn:@"plan_desc"];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planCloseDate = [rs stringForColumn:@"plan_close_date"];
        record.insurableAgeHigh = [NSNumber numberWithInt:[rs intForColumn:@"insurable_age_high"]];
        record.insurableAgeLow = [NSNumber numberWithInt:[rs intForColumn:@"insurable_age_low"]];
        record.faceAmtType = [rs stringForColumn:@"face_amt_type"];
        record.faceAmtMaxi = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_maxi"]];
        record.faceAmtMini = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_mini"]];
        record.unitValueInd = [rs stringForColumn:@"unit_value_ind"];
        record.unitValue = [NSNumber numberWithInt:[rs intForColumn:@"unit_value"]];
        record.coverageYearAge = [NSNumber numberWithInt:[rs intForColumn:@"coverage_year_age"]];
        record.coverageYearDur = [NSNumber numberWithInt:[rs intForColumn:@"coverage_year_dur"]];
        record.premiumYearDur = [NSNumber numberWithInt:[rs intForColumn:@"premium_year_dur"]];
        record.premiumYearAge = [NSNumber numberWithInt:[rs intForColumn:@"premium_year_age"]];
        record.premCalcType = [rs stringForColumn:@"prem_calc_type"];
        record.premRateInd = [rs stringForColumn:@"prem_rate_ind"];
        record.ratePlanCode = [rs stringForColumn:@"rate_plan_code"];
        record.rateRateScale = [rs stringForColumn:@"rate_rate_scale"];
        record.rateAgeInd = [rs stringForColumn:@"rate_age_ind"];
        record.rateDurInd = [rs stringForColumn:@"rate_dur_ind"];
        record.rateSexInd = [rs stringForColumn:@"rate_sex_ind"];
        record.rateMediInd = [rs stringForColumn:@"rate_medi_ind"];
        record.rateOccuInd = [rs stringForColumn:@"rate_occu_ind"];
        record.rateInsuInd = [rs stringForColumn:@"rate_insu_ind"];
        record.wpInd = [rs stringForColumn:@"wp_ind"];
        record.primaryRiderInd = [rs stringForColumn:@"primary_rider_ind"];
        record.saPlanCode = [rs stringForColumn:@"sa_plan_code"];
        record.saRateScale = [rs stringForColumn:@"sa_rate_scale"];
        record.prPlanCode = [rs stringForColumn:@"pr_plan_code"];
        record.prRateScale = [rs stringForColumn:@"pr_rate_scale"];
        record.rpuInd = [rs stringForColumn:@"rpu_ind"];
        record.cvType = [rs stringForColumn:@"cv_type"];
        record.commPlanCode = [rs stringForColumn:@"comm_plan_code"];
        record.commRateScale = [rs stringForColumn:@"comm_rate_scale"];
        record.hratExist = [rs stringForColumn:@"hrat_exist"];
        record.cpExist = [rs stringForColumn:@"cp_exist"];
        record.cvExist = [rs stringForColumn:@"cv_exist"];
        record.pvExist = [rs stringForColumn:@"pv_exist"];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.planAbbrOrder = [NSNumber numberWithInt:[rs intForColumn:@"planAbbr_order"]];
        record.periodOrder = [NSNumber numberWithInt:[rs intForColumn:@"period_order"]];
        record.periodDesc = [rs stringForColumn:@"period_desc"];
        record.planCodeOrder = [NSNumber numberWithInt:[rs intForColumn:@"planCode_order"]];
        record.planCodeDesc = [rs stringForColumn:@"planCode_desc"];
        record.pricingIx = [NSNumber numberWithDouble:[rs doubleForColumn:@"pricing_ix"]];
        record.currency = [rs stringForColumn:@"currency"];
        record.promiseRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"promise_rate"]];
        record.attendRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"attend_rate"]];
        record.firstRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"first_rate"]];
        record.baseRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"base_rate"]];
        record.stdRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"std_rate"]];
        record.liborRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"libor_rate"]];
        record.calcuType = [rs stringForColumn:@"calcu_type"];
        record.modx = [NSNumber numberWithInt:[rs intForColumn:@"modx"]];
    }
    return record;
}

#pragma mark anPldf
- (pldf*)getAnPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType
{
    pldf *record = [[[pldf alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"Select * From pldf Where plan_code = '%@' Order by rate_scale desc",planCode];
    //NSLog(@"db:%@",strSQL);
    FMResultSet *rs = [[DatabaseFunction GetdataDB] executeQuery:strSQL];
    if ([rs next])
    {
        record.planCode = [rs stringForColumn:@"plan_code"];
        record.rateScale = [rs stringForColumn:@"rate_scale"];
        record.planDesc = [rs stringForColumn:@"plan_desc"];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planCloseDate = [rs stringForColumn:@"plan_close_date"];
        record.insurableAgeHigh = [NSNumber numberWithInt:[rs intForColumn:@"insurable_age_high"]];
        record.insurableAgeLow = [NSNumber numberWithInt:[rs intForColumn:@"insurable_age_low"]];
        //record.planObjArray = [rs stringForColumn:@"plan_obj_array"];
        //record.planTermInd = [rs stringForColumn:@"plan_term_ind"];
        record.faceAmtType = [rs stringForColumn:@"face_amt_type"];
        record.faceAmtMaxi = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_maxi"]];
        record.faceAmtMini = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_mini"]];
        //record.faceAmtChdMaxi = [NSNumber numberWithInt:[rs intForColumn:@"face_amt_chd_maxi"]];
        record.unitValueInd = [rs stringForColumn:@"unit_value_ind"];
        record.unitValue = [NSNumber numberWithInt:[rs intForColumn:@"unit_value"]];
        record.coverageYearAge = [NSNumber numberWithInt:[rs intForColumn:@"coverage_year_age"]];
        record.coverageYearDur = [NSNumber numberWithInt:[rs intForColumn:@"coverage_year_dur"]];
        record.premiumYearDur = [NSNumber numberWithInt:[rs intForColumn:@"premium_year_dur"]];
        record.premiumYearAge = [NSNumber numberWithInt:[rs intForColumn:@"premium_year_age"]];
        //record.modeInd = [rs stringForColumn:@"mode_ind"];
        record.premCalcType = [rs stringForColumn:@"prem_calc_type"];
        record.premRateInd = [rs stringForColumn:@"prem_rate_ind"];
        record.ratePlanCode = [rs stringForColumn:@"rate_plan_code"];
        record.rateRateScale = [rs stringForColumn:@"rate_rate_scale"];
        record.rateAgeInd = [rs stringForColumn:@"rate_age_ind"];
        record.rateDurInd = [rs stringForColumn:@"rate_dur_ind"];
        record.rateSexInd = [rs stringForColumn:@"rate_sex_ind"];
        record.rateMediInd = [rs stringForColumn:@"rate_medi_ind"];
        record.rateOccuInd = [rs stringForColumn:@"rate_occu_ind"];
        record.rateInsuInd = [rs stringForColumn:@"rate_insu_ind"];
        //record.rateSubInd_1 = [rs stringForColumn:@"rate_sub_ind_1"];
        //record.rateSubInd_2 = [rs stringForColumn:@"rate_sub_ind_2"];
        record.wpInd = [rs stringForColumn:@"wp_ind"];
        record.primaryRiderInd = [rs stringForColumn:@"primary_rider_ind"];
        //record.renewableAge = [NSNumber numberWithInt:[rs intForColumn:@"renewable_age"]];
        record.saPlanCode = [rs stringForColumn:@"sa_plan_code"];
        record.saRateScale = [rs stringForColumn:@"sa_rate_scale"];
        //record.saAgeInd = [rs stringForColumn:@"sa_age_ind"];
        record.prPlanCode = [rs stringForColumn:@"pr_plan_code"];
        record.prRateScale = [rs stringForColumn:@"pr_rate_scale"];
        record.rpuInd = [rs stringForColumn:@"rpu_ind"];
        //record.etiInd = [rs stringForColumn:@"eti_ind"];
        //record.etiMethod = [rs stringForColumn:@"eti_method"];
        record.cvType = [rs stringForColumn:@"cv_type"];
        record.commPlanCode = [rs stringForColumn:@"comm_plan_code"];
        record.commRateScale = [rs stringForColumn:@"comm_rate_scale"];
        //record.groupDiscInd = [rs stringForColumn:@"group_disc_ind"];
        record.hratExist = [rs stringForColumn:@"hrat_exist"];
        record.cpExist = [rs stringForColumn:@"cp_exist"];
        record.cvExist = [rs stringForColumn:@"cv_exist"];
        record.pvExist = [rs stringForColumn:@"pv_exist"];
        //record.ratingInd = [rs stringForColumn:@"rating_ind"];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.planAbbrOrder = [NSNumber numberWithInt:[rs intForColumn:@"planAbbr_order"]];
        record.periodOrder = [NSNumber numberWithInt:[rs intForColumn:@"period_order"]];
        record.periodDesc = [rs stringForColumn:@"period_desc"];
        record.planCodeOrder = [NSNumber numberWithInt:[rs intForColumn:@"planCode_order"]];
        record.planCodeDesc = [rs stringForColumn:@"planCode_desc"];
        record.pricingIx = [NSNumber numberWithDouble:[rs doubleForColumn:@"pricing_ix"]];
        record.divInd = [rs stringForColumn:@"div_ind"];
        record.currency = [rs stringForColumn:@"currency"];
    }
    return record;
}

- (NSArray*)getAnPayDue:(NSString*)planCode andPricingIx:(NSNumber*)anPricingIx
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from AnPayDue where an_pricing_ix = %@ order by plan_code, sex, age", anPricingIx];
    FMResultSet *rs = [[DatabaseFunction GetAnRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        anPayDue *due = [[anPayDue alloc] init];
        due.planCode = [rs stringForColumn:@"plan_code"];
        due.rateScale = [rs stringForColumn:@"rate_scale"];
        due.age = [NSNumber numberWithInteger:[rs intForColumn:@"age"]];
        due.sex = [rs stringForColumn:@"sex"];
        due.dur = [NSNumber numberWithInteger:[rs intForColumn:@"dur"]];
        due.anPricingIx = [NSNumber numberWithInteger:[rs intForColumn:@"an_pricing_ix"]];
        due.aDue = [NSNumber numberWithDouble:[rs doubleForColumn:@"a_due"]];
        [array addObject:due];
        [due release];
    }
    return array;
}

#pragma mark - 取得基金淨值
- (NSArray*)getVivhsWithInvsCode:(NSString*)invsCode andStartInvsDate:(NSString*)startDate andSimulateMons:(NSNumber*)mons
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from pc_vivhs where invs_code = '%@' and invs_date >= '%@' order by invs_date limit %i",invsCode, startDate, [mons integerValue] * 31];
    FMResultSet *rs = [[DatabaseFunction GetVivhsDB] executeQuery:strSQL];
    
    while ([rs next])
    {
        vivhs *info = [[vivhs alloc] init];
        info.invsCode = [rs stringForColumn:@"invs_code"];
        info.invsDate = [rs stringForColumn:@"invs_date"];
        info.currency = [rs stringForColumn:@"currency2"];
        info.invsValue = [NSNumber numberWithDouble:[rs doubleForColumn:@"invs_value_buy"]];
        [array addObject:info];
        [info release];
    }
    return array;
}

#pragma mark - load from occu
- (NSDictionary*)getKindInOccu
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"Select distinct kindb from occu order by kinds_no"];
    FMResultSet *rs = [db executeQuery:strSQL];
    while ([rs next])
    {
        NSString *kindb = [rs stringForColumn:@"kindb"];
        [dict setValue:kindb forKey:@""];
    }
    return dict;
}

#pragma mark 確認id是否存在
- (BOOL)checkExistAgentCodeInPass:(NSString*)agentCode
{
    NSString *strSQL = [NSString stringWithFormat:@"select count(agent_code) from login  where agent_code = '%@'",agentCode];
    NSUInteger counter = [[DatabaseFunction GetPassDB] intForQuery:strSQL];
    if (counter > 0)
        return YES;
    return NO;
}

#pragma mark 取得登入log
- (NSArray*)getLoginLogArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from loginLog order by seq desc LIMIT 100"];
    FMResultSet *rs = [[DatabaseFunction GetPassDB] executeQuery:strSQL];
    while ([rs next])
    {
        loginLogInfo *info = [[loginLogInfo alloc] init];
        info.agentCode = [rs stringForColumn:@"agent_code"];
        info.agentName = [rs stringForColumn:@"agent_name"];
        info.loginDate = [rs stringForColumn:@"logindate"];
        info.log = [rs stringForColumn:@"log"];
        info.seq = [NSNumber numberWithInt:[rs intForColumn:@"seq"]];
        [array addObject:info];
        [info release];
    }
    return array;
}
#pragma mark 取得更新log
- (NSArray*)getUpdateLogArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *versionArray = [NSMutableArray arrayWithCapacity:0];
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:@"select distinct version from updateLog order by version desc"];
    while ([rs next])
    {
        [versionArray addObject:[rs stringForColumn:@"version"]];
    }
    for (NSString *version in versionArray)
    {
        FMResultSet *rs2 = [[DatabaseFunction GetRefDB] executeQuery:@"select * from updateLog where version = ? order by seq",version];
        NSMutableArray *groupArray = [NSMutableArray arrayWithCapacity:0];
        while([rs2 next])
        {
            updateLogInfo *info = [[updateLogInfo alloc] init];
            info.date = [rs2 stringForColumn:@"date"];
            info.log = [rs2 stringForColumn:@"log"];
            info.version = [rs2 stringForColumn:@"version"];
            info.seq = [NSNumber numberWithInt:[rs2 intForColumn:@"seq"]];
            [groupArray addObject:info];
            [info release];
        }
        updateLogGroup *group = [[updateLogGroup alloc] init];
        group.version = version;
        group.updateLogArray = [NSArray arrayWithArray:groupArray];
        [array addObject:group];
        [group release];
    }
    return array;
}

#pragma mark - 取得儲存中的檔案內容
- (NSMutableArray*)getSavePrposalArray
{
    NSString *strSQL = [NSString stringWithFormat:@"select * from saveList Order by process_date desc,file_name"];
    FMResultSet *rs = [[DatabaseFunction GetSaveProposalDB] executeQuery:strSQL];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    while ([rs next])
    {
        saveProposalInfo *record = [[saveProposalInfo alloc] init];
        record.fileName = [rs stringForColumn:@"file_name"];
        record.agentCode = [rs stringForColumn:@"agent_code"];
        record.i1Relation = [rs stringForColumn:@"i1_relation"];
        record.o1Relation = [rs stringForColumn:@"o1_relation"];
        record.saveInd = [rs stringForColumn:@"save_ind"];
        record.customerInd = [rs stringForColumn:@"customer_ind"];
        record.proposalType = [rs stringForColumn:@"proposal_type"];
        record.policyNo = [rs stringForColumn:@"policy_no"];
        record.processDate = [rs stringForColumn:@"process_date"];
        record.modx = [rs stringForColumn:@"modx"];
        record.cloudId = [rs stringForColumn:@"cloud_id"];
        [array addObject:record];
        [record release];
    }
    return array;
}
- (NSArray*)getDateGroupFromSaveList
{
    NSString *strSQL = [NSString stringWithFormat:@"select distinct process_date from saveList order by process_date desc"];
    FMResultSet *rs = [[DatabaseFunction GetSaveProposalDB] executeQuery:strSQL];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    while ([rs next])
    {
        NSString *date = [NSString stringWithFormat:@"%@",[rs stringForColumn:@"process_date"]];
        [array addObject:date];
    }
    return array;
}

#pragma mark 取得存檔詳細內容
- (NSArray*)getSavePlanWithFileName:(NSString*)fileName andProposalType:(NSString*)proposalType
{
    NSString *strSQL = [NSString stringWithFormat:@"select * from savePlan where file_name = '%@'",fileName];
    FMResultSet *rs = [[DatabaseFunction GetSaveProposalDB] executeQuery:strSQL];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    while ([rs next])
    {
        savePlanInfo *info = [[savePlanInfo alloc] init];
        info.fileName = [rs stringForColumn:@"file_name"];
        info.planCode = [rs stringForColumn:@"plan_code"];
        info.rateScale = [rs stringForColumn:@"rate_scale"];
        info.planDesc = [rs stringForColumn:@"plan_desc"];
        info.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        info.relationCode = [rs stringForColumn:@"relation_code"];
        //info.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        //info.planDesc = [rs stringForColumn:@"plan_desc"];
        //info.modePrem = [NSNumber numberWithDouble:[rs doubleForColumn:@"mode_prem"]];
        info.planType = [rs stringForColumn:@"plan_type"];
        info.declareRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"declare_rate"]];
        info.faceAmt = [NSNumber numberWithDouble:[rs doubleForColumn:@"face_amt"]];
        info.socialInsurance = [rs stringForColumn:@"social_insurance"];
        info.cwprInd = [NSNumber numberWithInt:[rs intForColumn:@"cwpr_ind"]];
        info.cwprPlan = [rs stringForColumn:@"cwpr_plan"];
        info.iwprInd = [NSNumber numberWithInt:[rs intForColumn:@"iwpr_ind"]];
        info.iwprPlan = [rs stringForColumn:@"iwpr_plan"];
        info.bodyType = [rs stringForColumn:@"body_type"];
        info.invsTargetPrem = [NSNumber numberWithDouble:[rs doubleForColumn:@"invs_targetPrem"]];
        info.firstPrem = [NSNumber numberWithDouble:[rs doubleForColumn:@"first_prem"]];
        info.invsPrem = [NSNumber numberWithDouble:[rs doubleForColumn:@"invs_prem"]];
        info.invsDurs = [NSNumber numberWithInt:[rs intForColumn:@"invs_durs"]];
        info.invsRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"invs_rate"]];
        info.loadingRate = [rs stringForColumn:@"loading_rate"];
        info.cityRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"city_rate"]];
        info.vaType = [NSNumber numberWithInt:[rs intForColumn:@"va_type"]];
        info.anRate = [NSNumber numberWithDouble:[rs intForColumn:@"an_rate"]];
        info.anDur = [NSNumber numberWithInt:[rs intForColumn:@"an_dur"]];
        info.anAge = [NSNumber numberWithInt:[rs intForColumn:@"an_age"]];
        info.anPrem = [NSNumber numberWithDouble:[rs doubleForColumn:@"an_prem"]];
        info.anPurePrem = [NSNumber numberWithDouble:[rs doubleForColumn:@"an_pure_amt"]];
        info.accuRateList = [rs stringForColumn:@"accu_rate_list"];
        info.periodCertain = [rs stringForColumn:@"period_certain"];
        info.saveInd = [NSNumber numberWithInt:[rs intForColumn:@"save_ind"]];
        info.agentCode = [rs stringForColumn:@"agent_code"];
        info.proposalType = [rs stringForColumn:@"proposal_type"];
        info.abbrType = [rs stringForColumn:@"abbr_type"];
        info.projectType = [rs stringForColumn:@"project_type"];
        info.relationIndex = [NSNumber numberWithInt:[rs intForColumn:@"relation_index"]];
        info.declarebookInd = [rs stringForColumn:@"declarebook_ind"];
        info.agentCode = [[systemParamater systemParamaterInstance] agentCode];
        [array addObject:info];
        [info release];
    }
    return array;
}


- (NSArray*)getInvsTargetInfoWithFileName:(NSString*)fileName
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from saveInvsTarget where file_name ='%@' order by invs_code", fileName];
    FMResultSet *rs = [[DatabaseFunction GetSaveProposalDB] executeQuery:strSQL];
    while ([rs next])
    {
        invsTarget *invs = [[invsTarget alloc] init];
        invs.invsCode = [rs stringForColumn:@"invs_code"];
        invs.invsTitle = [rs stringForColumn:@"invs_desc"];
        invs.invsStsDate = [rs stringForColumn:@"issu_date"];
        invs.currencyType = [rs stringForColumn:@"currency"];
        invs.invsValue = [NSNumber numberWithDouble:0];
        invs.invsRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"invs_percent"]];
        /*
         取得淨值
         */
        NSArray *vivhValue = [self getInvsTargetValueWithInvsTargetCode:invs.invsCode];
        if ([vivhValue count] > 0)
        {
            vivhs *first = [vivhValue objectAtIndex:0];
            invs.invsValue = first.invsValue;
            invs.invsValueDate = first.invsDate;
        }
        [array addObject:invs];
        [invs release];
    }
    return array;
}

#pragma mark - 取得日期清單
- (NSArray*)getSaveReportDateArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select distinct process_date from saveReport order by process_date desc"];
    FMResultSet *rs = [[DatabaseFunction GetSaveProposalDB] executeQuery:strSQL];
    while ([rs next])
    {
        [array addObject:[rs stringForColumn:@"process_date"]];
    }
    return array;
}

- (NSArray*)getPolicyArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select distinct policy_no from savePocl  order by policy_no desc"];
    FMResultSet *rs = [[DatabaseFunction GetSaveProposalDB] executeQuery:strSQL];
    while ([rs next])
    {
        [array addObject:[rs stringForColumn:@"policy_no"]];
    }
    return array;
}

- (NSArray*)getClntArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from saveClnt"];
    FMResultSet *rs = [[DatabaseFunction GetSaveProposalDB] executeQuery:strSQL];
    while ([rs next])
    {
        customerInfo *info = [[customerInfo alloc] init];
        info.clientID = [rs stringForColumn:@"client_id"];
        info.name = [rs stringForColumn:@"name"];
        info.sex = [rs stringForColumn:@"sex"];
        info.birthDate = [rs stringForColumn:@"birth_date"];
        info.marriage = [rs stringForColumn:@"education"];
        info.education = [rs stringForColumn:@"education"];
        info.tel1 = [rs stringForColumn:@"tel1"];
        info.tel2 = [rs stringForColumn:@"tel2"];
        info.cellPhone = [rs stringForColumn:@"cellphone"];
        info.fax = [rs stringForColumn:@"fax"];
        info.email = [rs stringForColumn:@"email"];
        info.zipCode = [rs stringForColumn:@"zip_code"];
        info.address = [rs stringForColumn:@"address"];
        info.occuCode = [rs stringForColumn:@"occu_code"];
        info.occuLevel = [NSNumber numberWithInteger:[rs intForColumn:@"occu_level"]];
        info.ratingRateLf = [NSNumber numberWithDouble:[rs doubleForColumn:@"rating_rate_lf"]];
        info.age = [NSNumber numberWithInt:[rs intForColumn:@"age"]];
        info.dataFlagIn = [rs stringForColumn:@"data_flag_in"];
        [array addObject:info];
        [info release];
    }
    return array;
}

- (NSArray*)getSaveSchedule
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from scheduleInformation order by schedule_id"];
    FMResultSet *rs = [[DatabaseFunction GetSaveProposalDB] executeQuery:strSQL];
    while ([rs next])
    {
        scheduleInfo *info = [scheduleInfo new];
        info.type = [rs stringForColumn:@"schedule_type"];
        info.conetnt = [rs stringForColumn:@"schedule_content"];
        info.clientId = [rs stringForColumn:@"schedule_id"];
        info.clientName = [rs stringForColumn:@"client_name"];
        info.processDate = [rs stringForColumn:@"process_date"];
        info.startTime = [rs stringForColumn:@"start_time"];
        info.endTime = [rs stringForColumn:@"end_time"];
        info.scheduleId = [NSNumber numberWithInteger:[rs intForColumn:@"schedule_id"]];
        info.status = [NSNumber numberWithInteger:[rs intForColumn:@"schedule_status"]];
        [array addObject:info];
        [info release];
    }
    return array;
}

- (BOOL)checkExistWithFileName:(NSString*)fileName
{
    NSString *strSQL = [NSString stringWithFormat:@"select count(*) from saveList Where file_name = '%@'",fileName];
    BOOL isExist = NO;
    NSInteger exist = [[DatabaseFunction GetSaveProposalDB] intForQuery:strSQL];
    if (exist > 0)
    {
        isExist = YES;
    }
    return isExist;
}

- (BOOL)checkExistWithCustomerID:(NSString*)clientID
{
    NSString *strSQL = [NSString stringWithFormat:@"select count(*) from saveClnt Where client_id = '%@'", clientID];
    BOOL isExist = NO;
    NSInteger exist = [[DatabaseFunction GetSaveProposalDB] intForQuery:strSQL];
    if (exist > 0)
    {
        isExist = YES;
    }
    return isExist;
}

- (BOOL)saveCustomerWithCustomerInfo:(customerInfo*)customer
{
    NSString *fields = [NSString stringWithFormat:@"(client_id,name,sex,birth_date,occu_code,occu_level,rating_rate_lf,age)"];
    NSString *para = [NSString stringWithFormat:@"('%@','%@','%@','%@','%@','%@',%@,%@)",
                      customer.clientID==nil?@"":customer.clientID,
                      customer.name==nil?@"":customer.name,
                      customer.sex==nil?@"":customer.sex,
                      customer.birthDate==nil?@"":customer.birthDate,
                      customer.occuCode==nil?@"":customer.occuCode,
                      customer.occuLevel,
                      customer.ratingRateLf,
                      customer.age];
    NSString *strSQL = [NSString stringWithFormat:@"insert into saveClnt %@ Values %@" ,fields ,para];
    BOOL result = [[DatabaseFunction GetSaveProposalDB] executeUpdate:strSQL]; 
    return result;
}
- (BOOL)saveProposalWithProposalInfo:(saveProposalInfo*)proposal
{
    NSString *fields = [NSString stringWithFormat:@"(file_name,agent_code,i1_relation,o1_relation,save_ind,customer_ind,proposal_type,policy_no,process_date,modx,cloud_id)"];
    NSString *para = [NSString stringWithFormat:@"('%@','%@','%@','%@','%@','%@','%@','%@','%@',%@,'%@')",
                      proposal.fileName==nil?@"":proposal.fileName,
                      proposal.agentCode==nil?@"":proposal.agentCode,
                      proposal.i1Relation==nil?@"":proposal.i1Relation,
                      proposal.o1Relation==nil?@"":proposal.o1Relation,
                      proposal.saveInd==nil?@"":proposal.saveInd,
                      proposal.customerInd==nil?@"":proposal.customerInd,
                      proposal.proposalType==nil?@"":proposal.proposalType,
                      proposal.policyNo==nil?@"":proposal.policyNo,
                      proposal.processDate==nil?@"":proposal.processDate,
                      proposal.modx,
                      proposal.cloudId==nil?@"":proposal.cloudId
                      ];
    NSString *strSQL = [NSString stringWithFormat:@"insert into saveList %@ Values %@" ,fields ,para];
    BOOL result = [[DatabaseFunction GetSaveProposalDB] executeUpdate:strSQL];
    //NSLog(@"SQL:%@",strSQL);
    return result;
}

- (BOOL)updateProposalWithFileName:(NSString*)fileName andCloudID:(NSString*)cloudID
{
    NSString *strSQL = [NSString stringWithFormat:@"update saveList set cloud_id = '%@' where file_name = '%@'", cloudID, fileName];
    
    BOOL result = [[DatabaseFunction GetSaveProposalDB] executeUpdate:strSQL];
    //NSLog(@"SQL:%@",strSQL);
    return result;
}

- (BOOL)savePlanWithSavePlanInfo:(savePlanInfo*)plan
{
    NSString *fields = [NSString stringWithFormat:@"(file_name,plan_code,rate_scale,plan_abbr_code,plan_desc,plan_type,relation_code,declare_rate,face_amt,mode_prem,social_insurance,cwpr_ind,cwpr_plan,iwpr_ind,iwpr_plan,body_type,invs_targetPrem,first_prem,invs_prem,invs_durs,invs_rate,invs_fee,loading_rate,city_rate,va_type,an_rate,an_dur,an_age,an_prem,an_pure_amt,accu_rate_list,period_certain,an_pay_type,save_ind,agent_code,proposal_type,abbr_type,relation_index,declarebook_ind)"];
    NSString *para = [NSString stringWithFormat:@"('%@','%@','%@','%@','%@','%@','%@','%@','%@',%@,'%@','%@','%@','%@','%@','%@','%@','%@',%@,'%@','%@','%@','%@','%@','%@',%@,%@,'%@','%@','%@','%@','%@','%@','%@','%@','%@',%@,'%@','%@')",
                      plan.fileName,
                      plan.planCode,
                      plan.rateScale,
                      plan.planAbbrCode,
                      plan.planDesc,
                      plan.planType,
                      plan.relationCode,
                      plan.declareRate,
                      plan.faceAmt,
                      plan.modePrem,
                      plan.socialInsurance,
                      plan.cwprInd,
                      plan.cwprPlan,
                      plan.iwprInd,
                      plan.iwprPlan,
                      plan.bodyType,
                      plan.invsTargetPrem,
                      plan.firstPrem,
                      plan.invsPrem,
                      plan.invsDurs,
                      plan.invsRate,
                      plan.invsFee,
                      plan.loadingRate,
                      plan.cityRate,
                      plan.vaType,
                      plan.anRate,
                      plan.anDur,
                      plan.anAge,
                      plan.anPrem,
                      plan.anPurePrem,
                      plan.accuRateList,
                      plan.periodCertain,
                      plan.anPayType,
                      plan.saveInd,
                      plan.agentCode,
                      plan.proposalType,
                      plan.abbrType,
                      plan.relationIndex,
                      plan.declarebookInd
                      ];
    NSString *strSQL = [NSString stringWithFormat:@"insert into savePlan %@ Values %@" ,fields ,para];
    BOOL result = [[DatabaseFunction GetSaveProposalDB] executeUpdate:strSQL]; 
    //NSLog(@"SQL:%@",strSQL);
    return result;
}

- (BOOL)saveInvsTargetInfoWithFileName:(NSString*)fileName andInvsTargetInfo:(invsTarget*)target
{
    NSString *fields = [NSString stringWithFormat:@"(file_name, plan_type, invs_code, invs_desc, issu_date, start_date, currency,invs_percent, agent_code)"];
    NSString *para = [NSString stringWithFormat:@"('%@', '%@', '%@', '%@', '%@', '%@', '%@', %@, '%@')",
                      fileName,
                      @"",
                      target.invsCode,
                      target.invsTitle,
                      target.invsStsDate,
                      target.invsStsDate,
                      target.currencyType,
                      target.invsRate,
                      [[systemParamater systemParamaterInstance] agentCode]];
    NSString *strSQL = [NSString stringWithFormat:@"insert into saveInvsTarget %@ Values %@", fields, para];
    BOOL result = [[DatabaseFunction GetSaveProposalDB] executeUpdate:strSQL];
    return result;
}

#pragma mark 儲存報表檔案
- (BOOL)saveSaveReportWithFileName:(NSString*)fileName andFilePath:(NSString*)filePath andSerial:(NSInteger)serial andProcessDate:(NSString*)date andCustomerInfo:(customerInfo*)customer
{
    NSString *fields = [NSString stringWithFormat:@"(file_name, file_path, seq, i1_name, i1_sex, i1_age, i1_birthday, process_date)"];
    NSString *para = [NSString stringWithFormat:@"('%@', '%@', %@, '%@', '%@', %@, '%@', '%@')",
                      fileName,
                      filePath,
                      [NSNumber numberWithInteger:serial],
                      customer.name,
                      customer.sex,
                      customer.age,
                      customer.birthDate,
                      date];
    NSString *strSQL = [NSString stringWithFormat:@"insert into saveReport %@ Values %@", fields, para];
    BOOL result = [[DatabaseFunction GetSaveProposalDB] executeUpdate:strSQL];
    return result;
}

#pragma mark 刪除存檔
- (BOOL)deleteSaveFileWithFileName:(NSString*)fileName
{
    BOOL succeed = YES;
    NSMutableArray *SQLArray = [NSMutableArray arrayWithCapacity:0];
    [SQLArray addObject:[NSString stringWithFormat:@"delete from saveAdjust where file_name = '%@'",fileName]];
    [SQLArray addObject:[NSString stringWithFormat:@"delete from saveDeclareRate where file_name = '%@'",fileName]];
    [SQLArray addObject:[NSString stringWithFormat:@"delete from saveInvsTarget where file_name = '%@'",fileName]];
    [SQLArray addObject:[NSString stringWithFormat:@"delete from saveList where file_name = '%@'",fileName]];
    [SQLArray addObject:[NSString stringWithFormat:@"delete from savePlan where file_name = '%@'",fileName]];
    for (NSString *SQL in SQLArray)
    {
        if (![[DatabaseFunction GetSaveProposalDB] executeUpdate:SQL])
        {
            succeed = NO;
        }
    }
    return succeed;
}

#pragma mark 刪除報表檔案
- (BOOL)deleteSaveReportWithFileName:(NSString*)fileName
{
    BOOL succeed = YES;
    NSString *strSQL = [NSString stringWithFormat:@"delete from saveReport where file_name = '%@'", fileName];
    if (![[DatabaseFunction GetSaveProposalDB] executeUpdate:strSQL])
    {
        succeed = NO;
    }
    return succeed;
}

#pragma mark 刪除行程動態
- (BOOL)deleteScheduleWithScheduleFileName:(NSString*)fileName;
{
    BOOL succeed = YES;
    NSString *strSQL = [NSString stringWithFormat:@"delete from saveSchedule where file_name = '%@'", fileName];
    if (![[DatabaseFunction GetSaveProposalDB] executeUpdate:strSQL])
    {
        succeed = NO;
    }
    return succeed;
}

#pragma mark - ref.sqlite

#pragma mark - 取得全部的職業代碼表
- (NSArray*)getOccuArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from occu order by occu_code"];
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        occuInfo *info = [[occuInfo alloc] init];
        info.occuCode = [rs stringForColumn:@"occu_code"];
        info.occuClass = [rs stringForColumn:@"occu_class"];
        info.occuDesc = [NSString stringWithFormat:@"%@%@",[rs stringForColumn:@"occu_desc"],[rs stringForColumn:@"occu_desc2"]];
        info.occuLevel = [rs stringForColumn:@"occu_level"];
        info.fee = [NSNumber numberWithInt:[rs intForColumn:@"rating_rate_lf"]];
        [array addObject:info];
        [info release];
    }
    return array;
}

#pragma mark 取得職業代碼類別清單
- (NSArray*)getOccuClass
{
    NSString *strSQL = [NSString stringWithFormat:@"select distinct occu_class from occu order by occu_code"];
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    while ([rs next])
    {
        NSString *occuClass = [NSString stringWithFormat:@"%@",[rs stringForColumn:@"occu_class"]];
        [array addObject:occuClass];
    }
    return array;
}

#pragma mark 取得職業代碼清單by類別
- (NSArray*)getOccuArrayWithOccuClass:(NSString*)occuClass
{
    NSString *strSQL = [NSString stringWithFormat:@"select * from occu where occu_class = '%@' order by occu_code",occuClass];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        occuInfo *info = [[occuInfo alloc] init];
        info.occuCode = [rs stringForColumn:@"occu_code"];
        info.occuClass = [rs stringForColumn:@"occu_class"];
        info.occuDesc = [NSString stringWithFormat:@"%@%@",[rs stringForColumn:@"occu_desc"],[rs stringForColumn:@"occu_desc2"]];
        info.occuLevel = [rs stringForColumn:@"occu_level"];
        info.fee = [NSNumber numberWithInt:[rs intForColumn:@"rating_rate_lf"]];
        [array addObject:info];
        [info release];
    }
    return array;
}
- (NSString*)getPlanTypeWithPlanAbbr:(NSString*)planAbbr
{
    NSString *strSQL = [NSString stringWithFormat:@"select plan_type from planAbbr where plan_abbr_code = '%@'",planAbbr];
    NSString *planType = [[DatabaseFunction GetRefDB] stringForQuery:strSQL];
    return planType;
}
- (NSArray*)getBodyTypeArray
{
    NSString *strSQL = [NSString stringWithFormat:@"select * from bodyType order by body_type"];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        bodyTypeInfo *info = [[bodyTypeInfo alloc] init];
        info.bodyType = [rs stringForColumn:@"body_type"];
        info.bodyDesc = [rs stringForColumn:@"body_desc"];
        [array addObject:info];
        [info release];
    }
    return array;
}

#pragma mark 取得幣別相對應的取位位數
- (NSInteger)getDigitWithCurrency:(NSString*)currency
{
    NSString *strSQL = [NSString stringWithFormat:@"select digit from currency Where code = '%@'",currency];
    NSInteger digit = [[DatabaseFunction GetRefDB] intForQuery:strSQL];
    return digit;
}

#pragma mark 取得幣別中文
- (NSString*)getCurrencyNameWithCurrency:(NSString*)currency
{
    NSString *strSQL = [NSString stringWithFormat:@"select desc from currency Where code = '%@'",currency];
    NSString *code = [[DatabaseFunction GetRefDB] stringForQuery:strSQL];
    return code;
}

#pragma mark 取得審閱期聲明書指示
- (NSString*)getDeclarebookIndWithPlanAbbr:(NSString*)planAbbr
{
    if ([planAbbr isEqualToString:@"MYFB"] || [planAbbr isEqualToString:@"MYFA"])
    {
        planAbbr  = [NSString stringWithFormat:@"MYF"];
    }
    NSString *strSQL = [NSString stringWithFormat:@"select declare_ind from insuranceProvision where plan_abbr_code = '%@'", planAbbr];
    NSString *declarebookInd = [[DatabaseFunction GetRefDB] stringForQuery:strSQL];
    return declarebookInd;
}

#pragma mark 取得一般投資型的投資標的
- (NSArray*)getInvsTargetWithInvsType:(NSString *)invsType andPlanAbbr:(NSString*)invsAbbr
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = nil;
    if ([invsType isEqualToString:@"V"])
    {
        if ([invsAbbr isEqualToString:@"AVL"])
        {
            strSQL = [NSString stringWithFormat:@"select * from invsTarget where prj_type = '3' order by show_order"];
        }
        else if ([invsAbbr isEqualToString:@"LVL"])
        {
            strSQL = [NSString stringWithFormat:@"select * from invsTarget where prj_type = '4' order by show_order"];
        }
        else
        {
            strSQL = [NSString stringWithFormat:@"select * from invsTarget where prj_type = '1' order by show_order"];
        }
    }
    else if ([invsType isEqualToString:@"L"])
    {
        strSQL = [NSString stringWithFormat:@"select * from invsTarget where prj_type = '2' order by show_order"];
    }
    
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    
    while ([rs next])
    {
        invsTarget *info = [[invsTarget alloc] init];
        info.invsCode = [rs stringForColumn:@"invs_code"];
        info.invsTitle = [rs stringForColumn:@"invs_title"];
        info.invsCompanyBno = [rs stringForColumn:@"invs_company_bno"];
        info.currencyType = [rs stringForColumn:@"currency_type"];
        info.invsType = [rs stringForColumn:@"invs_type"];
        info.invsStsCode = [rs stringForColumn:@"invs_sts_code"];
        info.invsStsDate = [rs stringForColumn:@"invs_sts_date"];
        info.invsMiniAmt = [NSNumber numberWithInteger:[rs intForColumn:@"invs_mini_amt"]];
        info.showOrder = [NSNumber numberWithInteger:[rs intForColumn:@"show_order"]];
        info.prjType = [rs stringForColumn:@"prj_type"];
        [array addObject:info];
        [info release];
    }
    return array;
}

#pragma mark - 取得最近的兩筆投資標的淨值
- (NSArray*)getInvsTargetValueWithInvsTargetCode:(NSString*)invsTarget
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select  *  from pc_vivhs  where invs_code = '%@' order by invs_date desc LIMIT 2",invsTarget];
    FMResultSet *rs = [[DatabaseFunction GetVivhsDB] executeQuery:strSQL];
    while ([rs next])
    {
        vivhs *info = [[vivhs alloc] init];
        info.invsCode = [rs stringForColumn:@"invs_code"];
        info.invsDate = [rs stringForColumn:@"invs_date"];
        //info.currency = [rs stringForColumn:@"currency2"];
        //info.invsTitle = [rs stringForColumn:@"invs_title"];
        info.invsValue = [NSNumber numberWithDouble:[rs doubleForColumn:@"invs_value_buy"]];
        [array addObject:info];
        [info release];
    }
    return array;
}

- (NSArray*)getCurrencyArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from pc_vexrt where exrt_source_ind = '1' order by currency2"];
    FMResultSet *rs = [[DatabaseFunction GetVivhsDB] executeQuery:strSQL];
    while ([rs next])
    {
        vexrt *exrt = [[vexrt alloc] init];
        exrt.exrtDate = [rs stringForColumn:@"exrt_date"];
        exrt.currency = [rs stringForColumn:@"currency2"];
        exrt.buyingRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"buying_rate"]];
        exrt.exrtSourceInd = [rs stringForColumn:@"exrt_source_ind"];
        [array addObject:exrt];
        [exrt release];
    }
    return array;
}

- (NSArray*)getSimulateTargetWithPlanAbbrCode:(NSString*)planAbbr
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = nil;
    if ([planAbbr isEqualToString:@"SVUL"])
    {
        strSQL = [NSString stringWithFormat:@"select * from simulateTarget  where invs_type = '1' or invs_type = '2' order by invs_type,seq"];
    }
    else if ([planAbbr isEqualToString:@"YVUL"])
    {
        strSQL = [NSString stringWithFormat:@"select * from simulateTarget  where invs_type = '3' order by invs_type,seq"];
    }
    else if ([planAbbr isEqualToString:@"DVA"])
    {
        strSQL = [NSString stringWithFormat:@"select * from simulateTarget  where invs_type = '0' or invs_type = '1' order by invs_type,seq"];
    }
    else
    {
        strSQL = [NSString stringWithFormat:@"select * from simulateTarget order by invs_type,seq"];
    }
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        simulateTarget *simulate = [[simulateTarget alloc] init];
        simulate.invsCode = [rs stringForColumn:@"invs_code"];
        simulate.invsName = [rs stringForColumn:@"invs_desc"];
        simulate.issueDate = [rs stringForColumn:@"issue_date"];
        simulate.startDate = [rs stringForColumn:@"start_date"];
        simulate.currency = [rs stringForColumn:@"currency"];
        simulate.currencyName = [rs stringForColumn:@"currency_desc"];
        simulate.currencyUnit = [rs stringForColumn:@"currency_unit"];
        simulate.targetType = [NSNumber numberWithInteger:[rs intForColumn:@"target_type"]];
        simulate.invsType = [NSNumber numberWithInteger:[rs intForColumn:@"invs_type"]];
        simulate.seq = [NSNumber numberWithInteger:[rs intForColumn:@"seq"]];
        [array addObject:simulate];
        [simulate release];
    }
    return array;
}

#pragma mark 取得公司簡介
- (NSArray*)getCompanyIntro
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from companyIntro order by seq"];
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        reportInformation1 *info = [[reportInformation1 alloc] init];
        info.type = [rs stringForColumn:@"type"];
        info.detail = [rs stringForColumn:@"detail"];
        info.seq = [NSNumber numberWithInteger:[rs intForColumn:@"seq"]];
        [array addObject:info];
        [info release];
    }
    return array;
}

#pragma mark 取得重大疾病說明
- (NSArray*)getImportantWithNo:(NSNumber*)number
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = nil;
    switch ([number integerValue])
    {
        case 1:
            strSQL = [NSString stringWithFormat:@"select * from ImportantInfo order by seq"];
            break;
        case 2:
            strSQL = [NSString stringWithFormat:@"select * from ImportantInfo2 order by seq"];
            break;
        case 3:
            strSQL = [NSString stringWithFormat:@"select * from ImportantInfo3 order by seq"];
            break;
        case 4:
            strSQL = [NSString stringWithFormat:@"select * from ImportantInfo4 order by seq"];
            break;
        case 5:
            strSQL = [NSString stringWithFormat:@"select * from ImportantInfo5 order by seq"];
            break;
        case 6:
            strSQL = [NSString stringWithFormat:@"select * from ImportantInfo6 order by seq"];
            break;
    }
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        if ([number integerValue] == 5)
        {
            reportInformation2 *info1 = [[reportInformation2 alloc] init];
            info1.desc1 = [rs stringForColumn:@"desc1"];
            info1.desc2 = [rs stringForColumn:@"desc2"];
            info1.desc3 = [rs stringForColumn:@"desc3"];
            info1.seq = [NSNumber numberWithInteger:[rs intForColumn:@"seq"]];
            [array addObject:info1];
            [info1 release];
        }
        else if ([number integerValue] == 3 || [number integerValue] == 4)
        {
            reportInformation1 *info2 = [[reportInformation1 alloc] init];
            info2.type = [rs stringForColumn:@"item_no"];
            info2.detail = [rs stringForColumn:@"item_desc"];
            info2.seq = [NSNumber numberWithInteger:[rs intForColumn:@"seq"]];
            [array addObject:info2];
            [info2 release];
        }
        else if ([number integerValue] == 1)
        {
            reportInformation1 *info3 = [[reportInformation1 alloc] init];
            info3.type = [rs stringForColumn:@"type"];
            info3.detail = [rs stringForColumn:@"detail"];
            [array addObject:info3];
            [info3 release];
        }
        else if ([number integerValue] == 2 || [number integerValue] == 6)
        {
            reportInformation3 *info4 = [[reportInformation3 alloc] init];
            info4.itemNo1 = [rs stringForColumn:@"item_no1"];
            info4.itemDesc1 = [rs stringForColumn:@"item_desc1"];
            info4.itemNo2 = [rs stringForColumn:@"item_no2"];
            info4.itemDesc2 = [rs stringForColumn:@"item_desc2"];
            info4.seq = [NSNumber numberWithInteger:[rs intForColumn:@"seq"]];
            [array addObject:info4];
            [info4 release];
        }
    }
    return array;
}

#pragma mark 取得報表內容
- (NSArray*)getReportInformationWithPlanAbbr:(NSString*)planAbbr
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from reportInformation Where plan_code = '%@' order by seq", planAbbr];
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        reportInformation1 *info = [[reportInformation1 alloc] init];
        info.type = [rs stringForColumn:@"type"];
        info.detail = [rs stringForColumn:@"content"];
        info.seq = [NSNumber numberWithInteger:[rs intForColumn:@"seq"]];
        [array addObject:info];
        [info release];
    }
    return array;
}

#pragma mark 取得列印項目
- (NSArray*)getReportItemWithProposalType:(NSString*)proposalType
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from reportItem where proposal_type = '%@' order by seq", proposalType];
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        printItem *item = [[printItem alloc] init];
        item.printItemCode = [rs stringForColumn:@"print_item"];
        item.printItemDesc = [rs stringForColumn:@"print_item_desc"];
        item.proposalType = [rs stringForColumn:@"proposal_type"];
        item.printRule = [rs stringForColumn:@"print_rule"];
        item.defaultValue = [rs stringForColumn:@"default_value"];
        item.seq = [NSNumber numberWithInteger:[rs intForColumn:@"seq"]];
        if ([item.defaultValue isEqualToString:@"YES"])
        {
            item.isSelected = YES;
        }
        [array addObject:item];
        [item release];
    }
    return array;
}

#pragma mark - 0:TSO   1:02TSO
- (NSArray*)getTSOWithTSOtype:(NSInteger)type
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = nil;
    if (type == 0)
    {
        strSQL = [NSString stringWithFormat:@"select * from TSO order by age"];
    }
    else if (type == 1)
    {
        strSQL = [NSString stringWithFormat:@"select * from 02TSO order by age"];
    }
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        TSOResult *tso = [[TSOResult alloc] init];
        tso.age1 = [NSNumber numberWithInteger:[rs intForColumn:@"age"]];
        tso.male1 = [NSNumber numberWithDouble:[rs doubleForColumn:@"male"]];
        tso.female1 = [NSNumber numberWithDouble:[rs doubleForColumn:@"female"]];
        tso.age2 = [NSNumber numberWithInteger:[rs intForColumn:@"age2"]];
        tso.male2 = [NSNumber numberWithDouble:[rs doubleForColumn:@"male2"]];
        tso.female2 = [NSNumber numberWithDouble:[rs doubleForColumn:@"female2"]];
        tso.age3 = [NSNumber numberWithInteger:[rs intForColumn:@"age3"]];
        tso.male3 = [NSNumber numberWithDouble:[rs doubleForColumn:@"male3"]];
        tso.female3 = [NSNumber numberWithDouble:[rs doubleForColumn:@"female4"]];
        [array addObject:tso];
        [tso release];
    }
    return array;
}

- (pdf4*)getPdf4WithPlanAbbr:(NSString*)planAbbr
{
    pdf4 *pdf = [[pdf4 alloc] init];
    NSString *strSQL = [NSString stringWithFormat:@"select * from pdf4 where plan_abbr = '%@'", planAbbr];
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        pdf.planAbbr = [rs stringForColumn:@"plan_abbr"];
        pdf.desc = [rs stringForColumn:@"desc"];
    }
    return [pdf autorelease];
}

#pragma mark 取得群組名稱
- (NSArray*)getOtherItemGroup
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select distinct group_name from otherItem order by seq"];
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        [array addObject:[rs stringForColumn:@"group_name"]];
    }
    return array;
}

#pragma mark 取得其它pdf清單
- (NSArray*)getOtherItem
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from otherItem order by seq"];
    FMResultSet *rs = [[DatabaseFunction GetRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        otherItem *other = [[otherItem alloc] init];
        other.displayName = [rs stringForColumn:@"display_name"];
        other.fileName = [rs stringForColumn:@"file_name"];
        other.groupName = [rs stringForColumn:@"group_name"];
        other.fileExt = [rs stringForColumn:@"file_ext"];
        other.seq = [rs stringForColumn:@"seq"];
        [array addObject:other];
        [other release];
    }
    return array;
}

#pragma mark 判斷建議類型取得pldf
- (pldf*)getPldfWithPlanCode:(NSString*)planCode andProposalType:(NSString*)proposalType
{
    pldf *record = nil;
    if ([proposalType isEqualToString:proposalType_lf])
    {
        record = [self getLfPldfWithPlanCode:planCode andProposalType:proposalType];
    }
    else if ([proposalType isEqualToString:proposalType_invs])
    {
        record = [self getInvsPldfWithPlanCode:planCode andProposalType:proposalType];
    }
    else if ([proposalType isEqualToString:proposalType_ul])
    {
        record = [self getUlPldfWithPlanCode:planCode andProposalType:proposalType];
    }
    else if ([proposalType isEqualToString:proposalType_hva])
    {
        record = [self getHvaPldfWithPlanCode:planCode andProposalType:proposalType];
    }
    else if ([proposalType isEqualToString:proposalType_an])
    {
        record = [self getAnPldfWithPlanCode:planCode andProposalType:proposalType];
    }
    return record;
}
#pragma mark - lfRef.sqlite

- (NSArray*)loadUwMatchWithPlanAbbrArray:(NSArray*)planArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *para = [self makeAbbrPara:planArray];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfUwMatch where plan_abbr_code in (%@)", para];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        lfUwMatch *match = [[lfUwMatch alloc] init];
        match.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        match.uwType = [rs stringForColumn:@"uw_type"];
        match.prjSeq = [rs stringForColumn:@"prj_seq"];
        match.uwMsg = [rs stringForColumn:@"uw_msg"];
        match.matchPlan = [rs stringForColumn:@"match_plan"];
        [array addObject:match];
        [match release];
    }
    return array;
}
- (NSArray*)loadUwMatch2WithPlanAbbrArray:(NSArray*)planArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *para = [self makeAbbrPara:planArray];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfUwMatch2 where plan_abbr_code in (%@)", para];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        lfUwMatch *match = [[lfUwMatch alloc] init];
        match.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        match.uwType = [rs stringForColumn:@"uw_type"];
        match.prjSeq = [rs stringForColumn:@"prj_seq"];
        match.uwMsg = [rs stringForColumn:@"uw_msg"];
        match.matchPlan = [rs stringForColumn:@"match_plan"];
        [array addObject:match];
        [match release];
    }
    return array;
}
- (NSArray*)loadUwRangeWithPlanAbbrArray:(NSArray*)planArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *para = [self makeAbbrPara:planArray];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfUwRange where plan_abbr_code in (%@)", para];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        lfUwRange *range = [[lfUwRange alloc] init];
        range.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        range.seq = [NSNumber numberWithInt:[rs intForColumn:@"seq"]];
        range.from = [NSNumber numberWithInt:[rs intForColumn:@"from"]];
        range.to = [NSNumber numberWithInt:[rs intForColumn:@"to"]];
        range.max = [NSNumber numberWithInt:[rs intForColumn:@"max"]];
        range.min = [NSNumber numberWithInt:[rs intForColumn:@"min"]];
        range.uwType = [rs stringForColumn:@"uw_type"];
        range.uwMsg = [rs stringForColumn:@"uw_msg"];
        range.prjSeq = [rs stringForColumn:@"prj_seq"];
        [array addObject:range];
        [range release];
    }
    return array;
}
- (NSArray*)loadUwRatioWithPlanAbbrArray:(NSArray*)planArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *para = [self makeAbbrPara:planArray];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfUwRatio where plan_abbr_code in (%@)", para];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        lfUwRatio *ratio = [[lfUwRatio alloc] init];
        ratio.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        ratio.planAmt = [NSNumber numberWithInt:[rs intForColumn:@"plan_amt"]];
        ratio.uwType = [rs stringForColumn:@"uw_type"];
        ratio.ratioPlan = [rs stringForColumn:@"ratio_plan"];
        ratio.ratio = [NSNumber numberWithDouble:[rs doubleForColumn:@"ratio"]];
        ratio.uwMsg = [rs stringForColumn:@"uw_msg"];
        [array addObject:ratio];
        [ratio release];
    }
    return array;
}
- (NSArray*)loadUwVS
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfUwVS order by A_type"];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        lfUwVS *vs = [[lfUwVS alloc] init];
        vs.seq = [NSNumber numberWithInt:[rs intForColumn:@"seq"]];
        vs.groupA = [rs stringForColumn:@"groupA"];
        vs.aType = [rs stringForColumn:@"A_type"];
        vs.Afrom = [NSNumber numberWithInt:[rs intForColumn:@"a_from"]];
        vs.Ato = [NSNumber numberWithInt:[rs intForColumn:@"a_to"]];
        vs.groupB = [rs stringForColumn:@"groupB"];
        vs.Bvalue = [NSNumber numberWithDouble:[rs doubleForColumn:@"B_value"]];
        vs.uwMsg = [rs stringForColumn:@"uw_msg"];
        vs.prjSeq = [rs stringForColumn:@"prj_seq"];
        [array addObject:vs];
        [vs release];
    }
    return array;
}
- (lfUwAge*)loadUwAgeWithPlanCode:(NSString*)planCode andSex:(NSString*)sex andAge:(NSNumber*)age
{
    lfUwAge *uwAge = [[lfUwAge alloc] init];
    uwAge.planCode = planCode;
    uwAge.rateSex = sex;
    uwAge.rateAgeStart = age;
    NSString *strSQL = [NSString stringWithFormat:
                        @"select * from lfUwAge Where plan_code = '%@' and rate_sex = '%@' and %@ between rate_age and rate_age_end" 
                        ,planCode, sex, age];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    if ([rs next])
    {
        uwAge.rateAgeEnd = [NSNumber numberWithInt:[rs intForColumn:@"rate_age_end"]];
        uwAge.maxAmt = [NSNumber numberWithInt:[rs intForColumn:@"max_amt"]];
    }
    strSQL = [NSString stringWithFormat:
                        @"select * from lfUwAgeMin Where plan_code = '%@' and rate_sex = '%@' and %@ between rate_age and rate_age_end "
                        ,planCode, sex, age];
    rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    if ([rs next])
    {
        uwAge.minAmt = [NSNumber numberWithInt:[rs intForColumn:@"min_amt"]];
    }
    return uwAge;
}
#pragma mark clcr 取得
- (lfClcr*)loadClcrWithPlanCode:(NSString*)planCode andClItem:(NSString*)clItem
{
    lfClcr *clcr = [[lfClcr alloc] init];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfClcr Where plan_code = '%@' and cl_item = '%@'", planCode, clItem];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    if ([rs next])
    {
        clcr.planCode = [rs stringForColumn:@"plan_code"];
        clcr.rateScale = [rs stringForColumn:@"rate_scale"];
        clcr.clItem = [rs stringForColumn:@"cl_item"];
        clcr.claimAmt = [NSNumber numberWithDouble:[rs doubleForColumn:@"claim_amt"]];
    }
    return clcr;
}
- (NSArray*)loadClcrWithClItem:(NSString*)clItem
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfClcr Where cl_item = '%@'", clItem];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        lfClcr *clcr = [[lfClcr alloc] init];
        clcr.planCode = [rs stringForColumn:@"plan_code"];
        clcr.rateScale = [rs stringForColumn:@"rate_scale"];
        clcr.clItem = [rs stringForColumn:@"cl_item"];
        clcr.claimAmt = [NSNumber numberWithInt:[rs intForColumn:@"claim_amt"]];
        [array addObject:clcr];
        [clcr release];
    }
    return array;
}

#pragma mark 取得insuranceRule中的值
- (NSArray*)loadInsuranceRuleWithType:(NSString*)type
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from InsuranceRule Where type = '%@'", type];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        insuranceRule *insu = [[insuranceRule alloc] init];
        insu.type = [rs stringForColumn:@"type"];
        insu.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        insu.seq = [NSNumber numberWithInt:[rs intForColumn:@"seq"]];
        [array addObject:insu];
        [insu release];
    }
    return array;
}

#pragma mark 取得 calcu中的值
- (lfCalcu*)loadLfCalcuWithPlanAbbr:(NSString*)planAbbr
{
    lfCalcu *calcu = [[lfCalcu alloc] init];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfCalcu Where plan_abbr_code = '%@'", planAbbr];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    if ([rs next])
    {
        calcu.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        calcu.CAREind = [NSNumber numberWithInt:[rs intForColumn:@"CARE_ind"]];
        calcu.DDind = [NSNumber numberWithInt:[rs intForColumn:@"DD_ind"]];
        calcu.ADind = [NSNumber numberWithInt:[rs intForColumn:@"AD_ind"]];
        calcu.CRind = [NSNumber numberWithInt:[rs intForColumn:@"CR_ind"]];
        calcu.RETURNind = [NSNumber numberWithInt:[rs intForColumn:@"RETURN_ind"]];
        calcu.LF1 = [NSNumber numberWithInt:[rs intForColumn:@"LF_1"]];
        calcu.LFmix = [NSNumber numberWithInt:[rs intForColumn:@"LF_mix"]];
    }
    return calcu;
}

#pragma mark 取得費率清單
- (NSArray*)loadLfPremWithpldf:(pldf*)apldf andSocialInd:(NSString*)social andCustomer:(customerInfo*)customer andFaceAmt:(NSNumber*)amt
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = nil;
    NSString *planCode = [NSString stringWithFormat:@"%@",apldf.ratePlanCode];
    NSString *calType = [NSString stringWithFormat:@"%@",apldf.premCalcType];
    double unitValue = [apldf.unitValue doubleValue];
    double faceAmt = [amt doubleValue];
    double originalPrem = 0;
    double cntFee = [customer.ratingRateLf doubleValue] / (10000 / unitValue);
    if (unitValue == 10)
    {
        faceAmt = faceAmt * 10;
    }
    if ([calType isEqualToString:@"1"])
    {
        if ([planCode isEqualToString:@"20JPA"])
        {
            strSQL = [NSString stringWithFormat:@"select * from lfPrat Where plan_code = '%@' and rate_occu = '%@' order by rate_sex, rate_age",planCode, customer.occuLevel];
        }
        else
        {
            strSQL = [NSString stringWithFormat:@"select * from lfPrat where plan_code = '%@' order by rate_sex, rate_age",planCode];
        }
    }
    else if ([calType isEqualToString:@"2"])
    {
        strSQL = [NSString stringWithFormat:@"select * from lfPrat where plan_code = '%@' and rate_insu = '%@' and rate_occu = '%@' order by rate_insu, rate_occu",planCode, social, customer.occuLevel];
    }
    else if([calType isEqualToString:@"3"])
    {
        strSQL = [NSString stringWithFormat:@"select * from lfPrat where plan_code = '%@' and rate_occu = '%@' order by rate_occu", planCode, customer.occuLevel];
    }
    else if ([calType isEqualToString:@"4"])
    {
        /*
         豁免
         */
        strSQL = [NSString stringWithFormat:@"select * from lfPrat where plan_code = '%@' order by rate_sex, rate_age",planCode];
    }
    else if ([calType isEqualToString:@"5"])
    {
        if ([planCode isEqualToString:@"ADDR"])
        {
            strSQL = [NSString stringWithFormat:@"select * from lfPrat where plan_code = '%@' and rate_occu = '%@' order by rate_age",planCode, customer.occuLevel];
        }
        else
        {
            strSQL = [NSString stringWithFormat:@"select * from lfPrat where plan_code = '%@' order by rate_age",planCode];
        }
    }
    else if ([calType isEqualToString:@"6"])
    {
        strSQL = [NSString stringWithFormat:@"select * from lfPrat where plan_code = '%@'",planCode];
    }
    else if ([calType isEqualToString:@"7"])
    {
        strSQL = [NSString stringWithFormat:@"select * from lfPrat Where plan_code = '%@' and rate_dur = '1' and rate order by rate_sex, rate_age",planCode];
    }
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        lfPrat *prat = [[lfPrat alloc] init];
        prat.planCode = [rs stringForColumn:@"plan_code"];
        prat.rateScale = [rs stringForColumn:@"rate_scale"];
        prat.rateAge = [NSNumber numberWithInt:[rs intForColumn:@"rate_age"]];
        prat.rateDur = [NSNumber numberWithInt:[rs intForColumn:@"rate_dur"]];
        prat.rateSex = [rs stringForColumn:@"rate_sex"];
        prat.rateOccu = [rs stringForColumn:@"rate_occu"];
        prat.rateInsu = [rs stringForColumn:@"rate_insu"];
        prat.rateUnit = [rs stringForColumn:@"rate_unit"];
        /*
         計算保費
         */
        double premFactor = [rs doubleForColumn:@"prem_factor"];
        
        if ([apldf.faceAmtType isEqualToString:@"1"])
        {
            if ([apldf.planType isEqualToString:@"L"] || [apldf.planType isEqualToString:@"R"])
            {
                originalPrem = (premFactor + cntFee) * faceAmt;
            }
            else
            {
                if ([apldf.planAbbrCode isEqualToString:@"KHI"] || [apldf.planAbbrCode isEqualToString:@"TPDR"])
                {
                    originalPrem = (premFactor + cntFee) * faceAmt;
                }
                else
                {
                    originalPrem = (premFactor) * faceAmt;
                }
            }
        }
        else if ([apldf.faceAmtType isEqualToString:@"2"])
        {
            originalPrem = premFactor * faceAmt;
        }
        NSUInteger digit = 0;
        if (![apldf.currency isEqualToString:@"TWD"])
        {
            digit = 2;
        }
        prat.premFactor = [[MathFunction mathFunctionInstance] roundWithDigit:digit andRoundNumber:[NSNumber numberWithDouble:originalPrem]];
        [array addObject:prat];
        [prat release];
    }
    NSLog(@"factorArray:planCode:%@,  個數:%i ",planCode, [array count]);
    return array;
}

#pragma mark 取得費率清單
- (NSArray*)loadLfPratWithpldf:(pldf*)apldf andSocialInd:(NSString*)social andCustomer:(customerInfo*)customer
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = nil;
    NSString *planCode = [NSString stringWithFormat:@"%@",apldf.ratePlanCode];
    NSString *calType = [NSString stringWithFormat:@"%@",apldf.premCalcType];
    if ([calType isEqualToString:@"1"])
    {
        if ([planCode isEqualToString:@"20JPA"])
        {
            strSQL = [NSString stringWithFormat:@"select * from lfPrat Where plan_code = '%@' and rate_occu = '%@' and rate order by rate_sex, rate_age",planCode, customer.occuLevel];
        }
        else
        {
            strSQL = [NSString stringWithFormat:@"select * from lfPrat where plan_code = '%@' order by rate_sex, rate_age",planCode];
        }
    }
    else if ([calType isEqualToString:@"2"])
    {
        strSQL = [NSString stringWithFormat:@"select * from lfPrat where plan_code = '%@' and rate_insu = '%@' and rate_occu = '%@' order by rate_insu, rate_occu",planCode, social, customer.occuLevel];
    }
    else if([calType isEqualToString:@"3"])
    {
        strSQL = [NSString stringWithFormat:@"select * from lfPrat where plan_code = '%@' and rate_occu = '%@' order by rate_occu", planCode, customer.occuLevel];
    }
    else if ([calType isEqualToString:@"4"])
    {
        /*
         豁免
         */
        strSQL = [NSString stringWithFormat:@"select * from lfPrat where plan_code = '%@' order by rate_sex, rate_age",planCode];
    }
    else if ([calType isEqualToString:@"5"])
    {
        if ([planCode isEqualToString:@"ADDR"])
        {
            strSQL = [NSString stringWithFormat:@"select * from lfPrat where plan_code = '%@' and rate_occu = '%@' order by rate_age",planCode, customer.occuLevel];
        }
        else
        {
            strSQL = [NSString stringWithFormat:@"select * from lfPrat where plan_code = '%@' order by rate_age",planCode];
        }
    }
    else if ([calType isEqualToString:@"6"])
    {
        strSQL = [NSString stringWithFormat:@"select * from lfPrat where plan_code = '%@'",planCode];
    }
    else if ([calType isEqualToString:@"7"])
    {
        strSQL = [NSString stringWithFormat:@"select * from lfPrat Where plan_code = '%@' and rate_dur = '1' and rate order by rate_sex, rate_age",planCode];
    }
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        lfPrat *prat = [[lfPrat alloc] init];
        prat.planCode = [rs stringForColumn:@"plan_code"];
        prat.rateScale = [rs stringForColumn:@"rate_scale"];
        prat.rateAge = [NSNumber numberWithInt:[rs intForColumn:@"rate_age"]];
        prat.rateDur = [NSNumber numberWithInt:[rs intForColumn:@"rate_dur"]];
        prat.rateSex = [rs stringForColumn:@"rate_sex"];
        prat.rateOccu = [rs stringForColumn:@"rate_occu"];
        prat.rateInsu = [rs stringForColumn:@"rate_insu"];
        prat.rateUnit = [rs stringForColumn:@"rate_unit"];
        /*
         計算保費
         */
        prat.premFactor = [NSNumber numberWithDouble:[rs doubleForColumn:@"prem_factor"]];
        [array addObject:prat];
        [prat release];
    }
    NSLog(@"factorArray:planCode:%@,  個數:%i ",planCode, [array count]);
    return array;
}

#pragma mark 取得費率
- (lfPrat*)loadLfPratWithPldf:(pldf*)currentPldf andCustomerInfo:(customerInfo*)customer andSocialInd:(NSString *)social andRateDur:(NSNumber*)dur
{
    lfPrat *prat = [[lfPrat alloc] init];
    NSString *strSQL = nil;
    NSMutableString *para = [NSMutableString stringWithCapacity:0];
    if (![currentPldf.rateAgeInd isEqualToString:@"0"])
    {
        [para appendFormat:@" and rate_age = %@",customer.age];
    }
    if ([currentPldf.rateSexInd isEqualToString:@"1"])
    {
        [para appendFormat:@" and rate_sex = '%@'",customer.sex];
    }
    if ([currentPldf.rateOccuInd isEqualToString:@"1"])
    {
        [para appendFormat:@" and rate_occu = '%@'",customer.occuLevel];
    }
    if ([currentPldf.rateInsuInd isEqualToString:@"1"])
    {
        [para appendFormat:@" and rate_insu = '%@'", social];
    }
    if ([currentPldf.premRateInd isEqualToString:@"S"])
    {
        //階梯型保費
        strSQL = [NSString stringWithFormat:@"select * from lfPrat Where plan_code = '%@' and rate_dur = %@ %@",currentPldf.ratePlanCode, dur, para];
    }
    else
    {
        strSQL = [NSString stringWithFormat:@"select * from lfPrat Where plan_code = '%@' %@",currentPldf.ratePlanCode, para];
    }
    
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    if ([rs next])
    {
        prat.planCode = [rs stringForColumn:@"plan_code"];
        prat.rateScale = [rs stringForColumn:@"rate_scale"];
        prat.rateAge = [NSNumber numberWithInt:[rs intForColumn:@"rate_age"]];
        prat.rateDur = [NSNumber numberWithInt:[rs intForColumn:@"rate_dur"]];
        prat.rateSex = [rs stringForColumn:@"rate_sex"];
        prat.rateOccu = [rs stringForColumn:@"rate_occu"];
        prat.rateInsu = [rs stringForColumn:@"rate_insu"];
        prat.rateUnit = [rs stringForColumn:@"rate_unit"];
        prat.premFactor = [NSNumber numberWithDouble:[rs doubleForColumn:@"prem_factor"]];
    }
    return prat;
}

#pragma mark lfFund
- (NSArray*)loadLfFundList
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfFundLst order by seq"];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        lfFund *record = [[lfFund alloc] init];
        record.planDesc = [rs stringForColumn:@"plan_desc"];
        record.seq = [NSNumber numberWithInt:[rs intForColumn:@"seq"]];
        record.itemType = [rs stringForColumn:@"item_type"];
        record.itemDesc = [rs stringForColumn:@"item_desc"];
        record.itemValue = [rs stringForColumn:@"item_value"];
        record.valueLimit = [rs stringForColumn:@"value_limit"];
        record.valueType = [rs stringForColumn:@"value_type"];
        [array addObject:record];
        [record release];
    }
    return array;
}

#pragma mark 取得佣金率
- (lfCrat*)loadLfCratWithPlanCode:(NSString*)planCode andPremiumYearDur:(NSNumber*)premDur andPlanAbbr:(NSString*)planAbbr andSex:(NSString*)sex andAge:(NSNumber*)age andO1Age:(NSNumber*)ageo1
{
    lfCrat *crat = [[lfCrat alloc] init];
    NSString *strSQL = nil;
    if ([planAbbr isEqualToString:@"KWPR"] || [planAbbr isEqualToString:@"IWPR"])
    {
        strSQL = [NSString stringWithFormat:@"select * from lfCrat Where comm_plan_code = '%@' and insu_age_start <= %@ and insu_age_end >= %@"
                  ,planCode ,ageo1, ageo1];
    }
    else if ([planAbbr isEqualToString:@"HSRS"] || [planAbbr isEqualToString:@"HSRCS"] || 
             [planAbbr isEqualToString:@"SIR"] || [planAbbr isEqualToString:@"HIR"] ||
             [planAbbr isEqualToString:@"HICR"] || [planAbbr isEqualToString:@"HCR"]
             || [planAbbr isEqualToString:@"STL"] || [planAbbr isEqualToString:@"CLE"])
    {
        //NSInteger premYearStart = 0;
        NSNumber *maxDur = [NSNumber numberWithInteger:75 - [age integerValue]];
        strSQL = [NSString stringWithFormat:@"select * from lfCrat Where comm_plan_code = '%@' and prem_year_start <= %@ and prem_year_end >= %@"
                  ,planCode ,maxDur, maxDur];
    }
    else if ([planAbbr isEqualToString:@"BLE"])
    {
        //premStart = 繳費年期
        strSQL = [NSString stringWithFormat:@"select * from lfCrat Where comm_plan_code = '%@' and prem_year_start <= %@ and prem_year_end >= %@"
                  ,planCode ,premDur, premDur];
    }
    else
    {
        strSQL = [NSString stringWithFormat:@"select * from lfCrat Where comm_plan_code = '%@' and insu_age_start <= %@ and insu_age_end >= %@"
                  ,planCode ,age, age];
    }
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    if ([rs next])
    {
        crat.commPlanCode = [rs stringForColumn:@"comm_plan_code"];
        crat.commRateScale = [rs stringForColumn:@"comm_rate_scale"];
        crat.premYearStart = [NSNumber numberWithInt:[rs intForColumn:@"prem_year_start"]];
        crat.premYearEnd = [NSNumber numberWithInt:[rs intForColumn:@"prem_year_end"]];
        crat.insuAgeStart = [NSNumber numberWithInt:[rs intForColumn:@"insu_age_start"]];
        crat.insuAgeEnd = [NSNumber numberWithInt:[rs intForColumn:@"insu_age_end"]];
        crat.commRate = [NSNumber numberWithDouble:[rs doubleForColumn:@"comm_rate"]];
    }
    return crat;
}

#pragma mark 取得高保額折扣
- (lfHrat*)loadLfHratWithPlanAbbrCode:(NSString*)planAbbr andTargetNumber:(NSNumber*)targetNumber
{
    lfHrat *hrat = [[lfHrat alloc] init];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfHrat Where plan_abbr_code = '%@' and prem_start <= %@ and prem_end >= %@ and dur_start = 0" ,planAbbr ,targetNumber ,targetNumber];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    if ([rs next])
    {
        hrat.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        hrat.rateScale = [rs stringForColumn:@"rate_scale"];
        hrat.premStart = [NSNumber numberWithInt:[rs intForColumn:@"prem_start"]];
        hrat.premEnd = [NSNumber numberWithInt:[rs intForColumn:@"prem_end"]];
        hrat.durStart = [NSNumber numberWithInt:[rs intForColumn:@"dur_start"]];
        hrat.durEnd = [NSNumber numberWithInt:[rs intForColumn:@"dur_end"]];
        hrat.discPerc = [NSNumber numberWithDouble:[rs doubleForColumn:@"disc_perc"]];
    }
    return hrat;
}

#pragma mark 取得商品特性說明
- (NSArray*)loadLfPoNoteWithPlanAbbr:(NSString*)planAbbr
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfPoNote where plan_abbr_code = '%@' order by seq", planAbbr];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        lfPoNote *note = [[lfPoNote alloc] init];
        note.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        note.seq = [NSNumber numberWithInt:[rs intForColumn:@"seq"]];
        note.msgFile = [rs stringForColumn:@"msgFile"];
        note.premMini = [NSNumber numberWithInt:[rs intForColumn:@"premMini"]];
        [array addObject:note];
        [note release];
    }
    return array;
}
- (NSArray*)loadLfPoNoteDescWithMsgFile:(NSString*)msgFile
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfPoNoteDesc where msgFile  = '%@' order by seq", msgFile];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        lfPoNoteDesc *desc = [[lfPoNoteDesc alloc] init];
        desc.msgFile = [rs stringForColumn:@"msgFile"];
        desc.deatil = [rs stringForColumn:@"detail"];
        desc.seq = [NSNumber numberWithInt:[rs intForColumn:@"seq"]];
        [array addObject:desc];
        [desc release];
    }
    return array;
}
- (NSArray*)loadComRptDescWithPlanAbbr:(NSString*)planAbbr andPlanCode:(NSString*)planCode
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from comRptDesc where secName = '%@' order by seq", planCode];
    FMResultSet *rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
    while ([rs next])
    {
        comRptDesc *comRpt = [[comRptDesc alloc] init];
        comRpt.rptNo = [NSNumber numberWithInt:[rs intForColumn:@"rptNo"]];
        comRpt.secName = [rs stringForColumn:@"secName"];
        comRpt.msgType = [NSNumber numberWithInt:[rs intForColumn:@"msgType"]];
        comRpt.desc01 = [rs stringForColumn:@"desc01"];
        comRpt.desc02 = [rs stringForColumn:@"desc02"];
        comRpt.desc03 = [rs stringForColumn:@"desc03"];
        comRpt.desc04 = [rs stringForColumn:@"desc04"];
        comRpt.desc05 = [rs stringForColumn:@"desc05"];
        comRpt.seq = [NSNumber numberWithInt:[rs intForColumn:@"seq"]];
        [array addObject:comRpt];
        [comRpt release];
    }
    if ([array count] == 0)
    {
        //試試planAbbr
        strSQL = [NSString stringWithFormat:@"select * from comRptDesc where secName = '%@' order by seq", planAbbr];
        rs = [[DatabaseFunction GetLfRefDB] executeQuery:strSQL];
        while ([rs next])
        {
            comRptDesc *comRpt = [[comRptDesc alloc] init];
            comRpt.rptNo = [NSNumber numberWithInt:[rs intForColumn:@"rptNo"]];
            comRpt.secName = [rs stringForColumn:@"secName"];
            comRpt.msgType = [NSNumber numberWithInt:[rs intForColumn:@"msgType"]];
            comRpt.desc01 = [rs stringForColumn:@"desc01"];
            comRpt.desc02 = [rs stringForColumn:@"desc02"];
            comRpt.desc03 = [rs stringForColumn:@"desc03"];
            comRpt.desc04 = [rs stringForColumn:@"desc04"];
            comRpt.desc05 = [rs stringForColumn:@"desc05"];
            comRpt.seq = [NSNumber numberWithInt:[rs intForColumn:@"seq"]];
            [array addObject:comRpt];
            [comRpt release];
        }
    }
    return array;
}

#pragma mark lfSa
- (lfSa*)loadArprFromSaWithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age
{
    lfSa *sa = [[[lfSa alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfSa Where sa_plan_code = '%@' and age = %@", planCode, age];
    FMResultSet *rs = [[DatabaseFunction GetSaDB] executeQuery:strSQL];
    
    if ([rs next])
    {
        sa.saPlanCode = [rs stringForColumn:@"sa_plan_code"];
        sa.saRateScale = [rs stringForColumn:@"sa_rate_scale"];
        sa.age = [NSNumber numberWithInt:[rs intForColumn:@"age"]];
        sa.durs = [NSNumber numberWithInt:[rs intForColumn:@"durs"]];
        sa.saFactor = [rs stringForColumn:@"sa_factor"];
    }
    return sa;
}

- (NSArray*)loadArsaFromArsaWithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from arsa where sa_plan_code = '%@' and age = %@", planCode, age];
    FMResultSet *rs = [[DatabaseFunction GetSaDB] executeQuery:strSQL];
    while ([rs next])
    {
        arsaInfo *arsa = [[arsaInfo alloc] init];
        arsa.planCode = [rs stringForColumn:@"sa_plan_code"];
        arsa.rateScale = [rs stringForColumn:@"sa_rate_scale"];
        arsa.age = [NSNumber numberWithInteger:[rs intForColumn:@"age"]];
        arsa.dur = [NSNumber numberWithInteger:[rs intForColumn:@"dur"]];
        arsa.saFactor = [NSNumber numberWithDouble:[rs doubleForColumn:@"sa_factor"]];
        arsa.addFactor = [NSNumber numberWithDouble:[rs doubleForColumn:@"add_factor"]];
        [array addObject:arsa];
        [arsa release];
    }
    return array;
}

- (lfSa*)loadArprFromSaWithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age andSex:(NSString*)sex
{
    lfSa *sa = [[[lfSa alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfSa Where sa_plan_code = '%@' and age = %@ and sex = '%@'", planCode, age, sex];
    FMResultSet *rs = [[DatabaseFunction GetSaDB] executeQuery:strSQL];
    
    if ([rs next])
    {
        sa.saPlanCode = [rs stringForColumn:@"sa_plan_code"];
        sa.saRateScale = [rs stringForColumn:@"sa_rate_scale"];
        sa.age = [NSNumber numberWithInt:[rs intForColumn:@"age"]];
        sa.durs = [NSNumber numberWithInt:[rs intForColumn:@"durs"]];
        sa.saFactor = [rs stringForColumn:@"sa_factor"];
    }
    return sa;
}

#pragma mark lfCp
- (lfCp*)loadArprFromCpWithPlanCode:(NSString*)plancode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age
{
    lfCp *cp = [[[lfCp alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfCp Where pr_plan_code = '%@' and age = %@", plancode, age];
    FMResultSet *rs = [[DatabaseFunction GetCpDB] executeQuery:strSQL];
    
    if ([rs next])
    {
        cp.prPlanCode = [rs stringForColumn:@"pr_plan_code"];
        cp.prRateScale = [rs stringForColumn:@"pr_rate_scale"];
        cp.age = [NSNumber numberWithInt:[rs intForColumn:@"age"]];
        cp.durs = [rs stringForColumn:@"durs"];
        cp.cpFactor = [rs stringForColumn:@"cp_factor"];
    }
    return cp;
}
- (lfCp*)loadArprFromCp2WithPlanCode:(NSString*)plancode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age andSex:(NSString*)sex
{
    lfCp *cp = [[[lfCp alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfCp2 Where pr_plan_code = '%@' and age = %@ and sex = '%@'", plancode, age, sex];
    FMResultSet *rs = [[DatabaseFunction GetCpDB] executeQuery:strSQL];
    
    if ([rs next])
    {
        cp.prPlanCode = [rs stringForColumn:@"pr_plan_code"];
        cp.prRateScale = [rs stringForColumn:@"pr_rate_scale"];
        cp.age = [NSNumber numberWithInt:[rs intForColumn:@"age"]];
        cp.sex = [rs stringForColumn:@"sex"];
        cp.durs = [rs stringForColumn:@"durs"];
        cp.cpFactor = [rs stringForColumn:@"cp_factor"];
    }
    return cp;
}


#pragma mark lfCv
- (lfCv*)loadArprFromCvWithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age andSex:(NSString*)sex
{
    lfCv *cv = [[[lfCv alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfCv where pr_plan_code = '%@' and age = %@ and sex = '%@'",planCode, age, sex];
    FMResultSet *rs = [[DatabaseFunction GetCvDB] executeQuery:strSQL];
    
    if ([rs next])
    {
        cv.prPlanCode = [rs stringForColumn:@"pr_plan_code"];
        cv.prRateScale = [rs stringForColumn:@"pr_rate_scale"];
        cv.sex = [rs stringForColumn:@"sex"];
        cv.age = [NSNumber numberWithInt:[rs intForColumn:@"age"]];
        cv.durs = [NSNumber numberWithInt:[rs intForColumn:@"durs"]];
        cv.cvUnitValue = [rs stringForColumn:@"cv_unit_value"];
    }
    return cv;
}

#pragma mark lfCv2
- (lfCv*)loadArprFromCv2WithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age andSex:(NSString*)sex
{
    lfCv *cv = [[[lfCv alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfCv2 where pr_plan_code = '%@' and age = %@ and sex = '%@'",planCode, age, sex];
    FMResultSet *rs = [[DatabaseFunction GetCvDB] executeQuery:strSQL];
    
    if ([rs next])
    {
        cv.prPlanCode = [rs stringForColumn:@"pr_plan_code"];
        cv.prRateScale = [rs stringForColumn:@"pr_rate_scale"];
        cv.sex = [rs stringForColumn:@"sex"];
        cv.age = [NSNumber numberWithInt:[rs intForColumn:@"age"]];
        cv.durs = [NSNumber numberWithInt:[rs intForColumn:@"durs"]];
        cv.cvUnitValue = [rs stringForColumn:@"cv_unit_value"];
    }
    return cv;
}

#pragma mark lfPv
- (lfPv*)loadArprFromPvWithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age andSex:(NSString*)sex
{
    lfPv *pv = [[[lfPv alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfPv where pr_plan_code = '%@' and age = %@ and sex = '%@'",planCode, age, sex];
    FMResultSet *rs = [[DatabaseFunction GetPvDB] executeQuery:strSQL];
    
    if ([rs next])
    {
        pv.prPlanCode = [rs stringForColumn:@"pr_plan_code"];
        pv.prRateScale = [rs stringForColumn:@"pr_rate_scale"];
        pv.sex = [rs stringForColumn:@"sex"];
        pv.age = [NSNumber numberWithInt:[rs intForColumn:@"age"]];
        pv.durs = [NSNumber numberWithInt:[rs intForColumn:@"durs"]];
        pv.pvUnitValue = [rs stringForColumn:@"pv_unit_value"];
    }
    return pv;
}

#pragma mark lfPv2
- (lfPv*)loadArprFromPv2WithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age andSex:(NSString*)sex
{
    lfPv *pv = [[[lfPv alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfPv2 where pr_plan_code = '%@' and age = %@ and sex = '%@'",planCode, age, sex];
    FMResultSet *rs = [[DatabaseFunction GetPvDB] executeQuery:strSQL];
    
    if ([rs next])
    {
        pv.prPlanCode = [rs stringForColumn:@"pr_plan_code"];
        pv.prRateScale = [rs stringForColumn:@"pr_rate_scale"];
        pv.sex = [rs stringForColumn:@"sex"];
        pv.age = [NSNumber numberWithInt:[rs intForColumn:@"age"]];
        pv.durs = [NSNumber numberWithInt:[rs intForColumn:@"durs"]];
        pv.pvUnitValue = [rs stringForColumn:@"pv_unit_value"];
    }
    return pv;
}

#pragma mark lfRpu
- (lfRpu*)loadArprFromRpuWithPlanCode:(NSString*)planCode andRateScale:(NSString*)rateScale andAge:(NSNumber*)age andSex:(NSString*)sex
{
    lfRpu *rpu = [[[lfRpu alloc] init] autorelease];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfRpu where pr_plan_code = '%@' and age = %@ and sex = '%@'",planCode, age, sex];
    FMResultSet *rs = [[DatabaseFunction GetRpuDB] executeQuery:strSQL];
    
    if ([rs next])
    {
        rpu.prPlanCode = [rs stringForColumn:@"pr_plan_code"];
        rpu.prRateScale = [rs stringForColumn:@"pr_rate_scale"];
        rpu.sex = [rs stringForColumn:@"sex"];
        rpu.age = [NSNumber numberWithInt:[rs intForColumn:@"age"]];
        rpu.durs = [NSNumber numberWithInt:[rs intForColumn:@"durs"]];
        rpu.rpuUnitValue = [rs stringForColumn:@"rpu_unit_value"];
    }
    return rpu;
}

- (NSArray*)loadAretFromAretWithPricingQx:(NSString*)pricingQx andPricingQxPerc:(NSNumber*)perc andPricingIx:(NSNumber*)pricingIx andCustomer:(customerInfo*)i1Customer
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfAret where pricing_qx = '%@' and pricing_qx_perc = %@ and pricing_ix = %@ and sex = '%@' and age <= 20 And eti_year < 20"
                        ,pricingQx, perc, pricingIx, i1Customer.sex];
    FMResultSet *rs = [[DatabaseFunction GetAretDB] executeQuery:strSQL];
    while ([rs next])
    {
        lfAret *aret = [[lfAret alloc] init];
        
        aret.pricingQx = [rs stringForColumn:@"pricing_qx"];
        aret.pricingQxPerc = [NSNumber numberWithInteger:[rs intForColumn:@"pricing_qx_perc"]];
        aret.pricingIx = [NSNumber numberWithDouble:[rs doubleForColumn:@"pricing_ix"]];
        aret.sex = [rs stringForColumn:@"sex"];
        aret.age = [NSNumber numberWithInteger:[rs intForColumn:@"age"]];
        aret.etiYear = [NSNumber numberWithInteger:[rs intForColumn:@"eti_year"]];
        aret.etiFactorT0 = [NSNumber numberWithDouble:[rs doubleForColumn:@"eti_factor_t0"]];
        aret.etiFactorT1 = [NSNumber numberWithDouble:[rs doubleForColumn:@"eti_factor_t1"]];
        aret.etiPeFactorT0 = [NSNumber numberWithDouble:[rs doubleForColumn:@"eti_pe_factor_t0"]];
        aret.etiPeFactorT1 = [NSNumber numberWithDouble:[rs doubleForColumn:@"eti_pe_factor_t1"]];
        [array addObject:aret];
        [aret release];
    }
    return array;
}

- (NSArray*)loadArprFromArprWithPlanCode:(NSString*)planCode andCustomer:(customerInfo*)customer
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from lfArpr where pr_plan_code = '%@' and sex = '%@' and age = %@ order by dur",
                        planCode, customer.sex, customer.age];
    FMResultSet *rs = [[DatabaseFunction GetArprDB] executeQuery:strSQL];
    while ([rs next])
    {
        arpr *info = [[arpr alloc] init];
        info.prPlanCode = [rs stringForColumn:@"pr_plan_code"];
        info.prRateScale = [rs stringForColumn:@"pr_rate_scale"];
        info.sex = [rs stringForColumn:@"sex"];
        info.age = [NSNumber numberWithInteger:[rs intForColumn:@"age"]];
        info.dur = [NSNumber numberWithInteger:[rs intForColumn:@"dur"]];
        info.pvUnitValue = [NSNumber numberWithDouble:[rs doubleForColumn:@"pv_unit_value"]];
        info.cvUnitValue = [NSNumber numberWithDouble:[rs doubleForColumn:@"cv_unit_value"]];
        info.rpuFactor = [NSNumber numberWithDouble:[rs doubleForColumn:@"rpu_factor"]];
        info.cpFactor = [NSNumber numberWithDouble:[rs doubleForColumn:@"cp_factor"]];
        [array addObject:info];
        [info release];
    }
    return array;
}

#pragma mark - 取得免付費電話欄位

- (NSArray*)GetServiceServiceData
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from ServiceTel order by seq"];
    FMResultSet *rs = [[DatabaseFunction GetdataDB] executeQuery:strSQL];
    while ([rs next])
    {
        serviceTel *info = [serviceTel new];
        info.companyName = [rs stringForColumn:@"companyName"];
        info.telphone = [rs stringForColumn:@"telephone"];
        info.type = [rs stringForColumn:@"type"];
        info.seq = [NSNumber numberWithInteger:[rs intForColumn:@"seq"]];
        [array addObject:info];
        [info release];
    }
    return array;
}

- (NSArray*)GetAbbrWithProposalType:(NSString *)proposalType andAbbrType:(NSString *)abbrType andPlanType:(NSString *)planType andProjectType:(NSUInteger)projectType andBrokerCode:(NSNumber*)brokerCode andPlanCategory:(NSString*)category andRelation:(NSString*)relation
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSMutableString *strSQL = [NSMutableString stringWithCapacity:0];
    if ([relation isEqualToString:relationI1])
    {
        //可選被保人的險種
        [strSQL setString:[NSString stringWithFormat:@"select * From planAbbr Where proposal_type = '%@' And plan_type = '%@' And abbr_type = '%@' And abbr_type <> '9' And broker_code = '%@' And primary_rider_ind = '%@' And plan_abbr_code  in (select plan_abbr_code from planAid where I_planCode <> '') Order by seq",proposalType, planType, abbrType, brokerCode, category]];
    }
    else if ([relation isEqualToString:relationSS])
    {
        //可選配偶的險種
        [strSQL setString:[NSString stringWithFormat:@"select * From planAbbr Where proposal_type = '%@' And plan_type = '%@' And abbr_type = '%@' And abbr_type <> '9' And broker_code = '%@' And primary_rider_ind = '%@' And plan_abbr_code  in (select plan_abbr_code from planAid where S_planCode <> '') Order by seq",proposalType, planType, abbrType, brokerCode, category]];
    }
    else if ([relation isEqualToString:relationC])
    {
        //可選子女的險種
        [strSQL setString:[NSString stringWithFormat:@"select * From planAbbr Where proposal_type = '%@' And plan_type = '%@' And abbr_type = '%@' And abbr_type <> '9' And broker_code = '%@' And primary_rider_ind = '%@' And plan_abbr_code  in (select plan_abbr_code from planAid where C_planCode <> '') Order by seq",proposalType, planType, abbrType, brokerCode, category]];
    }
    else
    {
        //其它
        [strSQL setString:[NSString stringWithFormat:@"select * From planAbbr Where proposal_type = '%@' And plan_type = '%@' And abbr_type = '%@' And abbr_type <> '9' And broker_code = '%@' And primary_rider_ind = '%@' And plan_abbr_code  in (select plan_abbr_code from planAid where I_planCode <> '') Order by seq",proposalType, planType, abbrType, brokerCode, category]];
    }
    //利變年金 & 一萬元專案 無險種
    //NSLog(@"SQL:%@",strSQL);
    /*
     新增 投資型限制、內勤限制
     1.內勤限制
     2.投資型
     3.外幣
     */
    abbr *record;
    FMResultSet *rs = [[DatabaseFunction GetdataDB] executeQuery:strSQL];
    while ([rs next])
    {
        record = [[abbr alloc] init];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planAbbrDesc = [rs stringForColumn:@"planAbbr_desc"];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.seq = [NSNumber numberWithInt:[rs intForColumn:@"seq"]];
        record.fbInd = [rs stringForColumn:@"fb_ind"];
        record.companyCode = [NSNumber numberWithInt:[rs intForColumn:@"company_code"]];
        record.brokerCode = [NSNumber numberWithInt:[rs intForColumn:@"broker_code"]];
        [array addObject:record];
        [record release];
    }
    return array;
}

- (NSArray*)GetPlanAidWithPlanAbbrCode:(NSString *)planAbbr
{
    //select * from planAid  where plan_abbr_code = 'ACR' order by planCode_order , period_order
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSString *strSQL = [NSString stringWithFormat:@"select * from planAid  where plan_abbr_code = '%@' order by planCode_order , period_order", planAbbr];
    
    //NSLog(@"SQL:%@",strSQL);
    planAid *record;
    
    FMResultSet *rs = [[DatabaseFunction GetdataDB] executeQuery:strSQL];
    while ([rs next])
    {
        record = [[planAid alloc] init];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planAbbrDesc = [rs stringForColumn:@"planAbbr_desc"];
        record.periodOrder = [NSNumber numberWithInt:[rs intForColumn:@"period_order"]];
        record.periodDesc = [rs stringForColumn:@"period_desc"];
        record.planCodeOrder = [NSNumber numberWithInt:[rs intForColumn:@"planCode_order"]];
        record.planCodeDesc = [rs stringForColumn:@"planCode_desc"];
        record.IPlanCode = [rs stringForColumn:@"I_planCode"];
        record.SPlanCode = [rs stringForColumn:@"S_planCode"];
        record.CPlanCode = [rs stringForColumn:@"C_planCode"];
        record.proposalType = [rs stringForColumn:@"proposal_type"];
        [array addObject:record];
        [record release];
    }
    return array;
}

- (NSArray*)GetAllPlanAidDataWithRelation:(NSString*)relation andAge:(NSNumber *)age
{
    //select  * from planAid  order by  planCode_order, period_order
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    NSMutableString *strSQL = [NSMutableString stringWithCapacity:0];
    if (age == nil)
    {
        age = [NSNumber numberWithInteger:30];
    }
    if ([relation isEqualToString:relationSS])
    {
        [strSQL setString:[NSString stringWithFormat:@"select a.broker_code, a.company_code,b.* from planAbbr as a,planAid as b where b.plan_abbr_code = a.plan_abbr_code and b.plan_type = a.plan_type and a.abbr_type <> 9 And b.S_planCode <> '' And b.plan_abbr_code in (select plan_abbr_code from pldf where insurable_age_high > %@ and insurable_age_low < %@) order by a.broker_code,b.plan_abbr_code,b.planCode_order, b.period_order", age, age]];
    }
    else if ([relation isEqualToString:relationC])
    {
        [strSQL setString:[NSString stringWithFormat:@"select a.broker_code, a.company_code,b.* from planAbbr as a,planAid as b where b.plan_abbr_code = a.plan_abbr_code and b.plan_type = a.plan_type and a.abbr_type <> 9 And b.C_planCode <> '' And b.plan_abbr_code in (select plan_abbr_code from pldf where insurable_age_high > %@ and insurable_age_low < %@) order by a.broker_code,b.plan_abbr_code,b.planCode_order, b.period_order", age, age]];
    }
    else
    {
        [strSQL setString:[NSString stringWithFormat:@"select a.broker_code, a.company_code,b.* from planAbbr as a,planAid as b where b.plan_abbr_code = a.plan_abbr_code and b.plan_type = a.plan_type and a.abbr_type <> 9 And b.I_planCode <> '' And b.plan_abbr_code in (select plan_abbr_code from pldf where insurable_age_high > %@ and insurable_age_low < %@) order by a.broker_code,b.plan_abbr_code,b.planCode_order, b.period_order", age, age]];
    }
    planAid *record;
    
    FMResultSet *rs = [[DatabaseFunction GetdataDB] executeQuery:strSQL];
    while ([rs next])
    {
        record = [[planAid alloc] init];
        record.planType = [rs stringForColumn:@"plan_type"];
        record.planAbbrCode = [rs stringForColumn:@"plan_abbr_code"];
        record.planAbbrDesc = [rs stringForColumn:@"planAbbr_desc"];
        record.periodOrder = [NSNumber numberWithInt:[rs intForColumn:@"period_order"]];
        record.periodDesc = [rs stringForColumn:@"period_desc"];
        record.planCodeOrder = [NSNumber numberWithInt:[rs intForColumn:@"planCode_order"]];
        record.planCodeDesc = [rs stringForColumn:@"planCode_desc"];
        record.IPlanCode = [rs stringForColumn:@"I_planCode"];
        record.SPlanCode = [rs stringForColumn:@"S_planCode"];
        record.CPlanCode = [rs stringForColumn:@"C_planCode"];
        record.proposalType = [rs stringForColumn:@"proposal_type"];
        record.companyCode = [NSNumber numberWithInt:[rs intForColumn:@"company_code"]];
        record.brokerCode = [NSNumber numberWithInt:[rs intForColumn:@"broker_code"]];
        [array addObject:record];
        [record release];
    }
    return array;
}

#pragma mark 共用函式區
- (NSString*)makeAbbrPara:(NSArray*)planArray
{
    NSMutableString *para = [NSMutableString stringWithCapacity:0];
    NSInteger counter = 0;
    for (savePlanInfo *info in planArray)
    {
        if (counter == [planArray count] - 1)
        {
            [para appendFormat:@"'%@'",info.planAbbrCode];
        }
        else
        {
            [para appendFormat:@"'%@',",info.planAbbrCode];
        }
        counter ++;
    }
    return para;
}
- (NSString*)makePlanCodePara:(NSArray*)planArray
{
    NSMutableString *para = [NSMutableString stringWithCapacity:0];
    for (savePlanInfo *info in planArray)
    {
        [para appendFormat:@"'%@',",info.planCode];
    }
    return para;
}

#pragma mark - 避免儲存null進db
- (NSString*)parseNullWithObject:(id)obj
{
    if ([obj isKindOfClass:[NSNumber class]])
    {
        if (obj == nil)
            return [NSString stringWithFormat:@"0"];
    }
    if (obj == nil)
        return [NSString stringWithFormat:@""];
    
    return [NSString stringWithFormat:@"%@",obj];
}
@end
