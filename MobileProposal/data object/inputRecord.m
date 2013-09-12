//
//  inputRecord.m
//  MLIproposal
//
//  Created by 張星星 on 12/6/11.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "inputRecord.h"

@implementation inputRecord
@synthesize planCategory, planType,planAbbr, planAbbrDesc, planCodeOrder , planOrder, planOrderDesc, planCodeOrderDesc;
@synthesize IplanCode, SplanCode, CplanCode;
@synthesize modx, clientId, relation, relationIndex, socialInsurance, declareRate, wprPlan, wprType, wprYear, faceAmt;
@synthesize bodyType, invsTargetPrem, firstPrem, invsPrem, invsDurs, anRate, anDur, anAge, anPrem;
@synthesize cityRate, invsRate, periodCertain, invsBonusRate;
@synthesize accuRate1, accuRate2, accuRate3, accuRate4, accuRate5, accuRate6;
@synthesize maxFaceAmt, minFaceAmt;

- (id)init
{
    self = [super init];
    if (self)
    {
        relationIndex = 1;
        modx = [[NSNumber alloc] initWithInteger:12];
        clientId = [[NSString alloc] initWithFormat:@""];
        relation = [[NSString alloc] initWithFormat:@"i1"];
        planType = [[NSString alloc] initWithFormat:planTypeL];
        socialInsurance = [[NSString alloc] initWithFormat:@"0"];
        declareRate = [[NSNumber alloc] initWithInt:2.25];
        wprPlan = [[NSString alloc] initWithFormat:@""];
        wprType = [[NSNumber alloc] initWithInt:0];
        faceAmt = [[NSNumber alloc] initWithInt:0];
        bodyType = [[NSString alloc] initWithFormat:@"0"];
        invsTargetPrem = [[NSNumber alloc] initWithInt:0];
        firstPrem = [[NSNumber alloc] initWithInt:0];
        invsPrem = [[NSNumber alloc] initWithInt:0];
        invsDurs = [[NSNumber alloc] initWithInt:20];
        invsRate = [[NSNumber alloc] initWithDouble:3.0];
        invsBonusRate = [[NSNumber alloc] initWithDouble:6.0];
        anRate = [[NSNumber alloc] initWithInt:1];
        anDur = [[NSNumber alloc] initWithInt:0];
        anAge = [[NSNumber alloc] initWithInt:0];
        anPrem = [[NSNumber alloc] initWithInt:0];
        cityRate = [[NSNumber alloc] initWithDouble:0];
        periodCertain = [[NSNumber alloc] initWithInt:0];
        accuRate1 = [[NSNumber alloc] initWithDouble:0];
        accuRate2 = [[NSNumber alloc] initWithDouble:1];
        accuRate3 = [[NSNumber alloc] initWithDouble:2];
        accuRate4 = [[NSNumber alloc] initWithDouble:2.5];
        accuRate5 = [[NSNumber alloc] initWithDouble:3];
        accuRate6 = [[NSNumber alloc] initWithDouble:4];
    }
    return self;
}

- (void)dealloc
{
    [planCategory release], planCategory = nil;
    [planType release], planType = nil;
    [planAbbr release], planAbbr = nil;
    [planAbbrDesc release], planAbbrDesc = nil;
    [planOrder release], planOrder = nil;
    [planOrderDesc release], planOrderDesc = nil;
    [planCodeOrderDesc release], planCodeOrderDesc = nil;
    [planCodeOrder release], planCodeOrder = nil;
    [IplanCode release], IplanCode = nil;
    [SplanCode release], SplanCode = nil;
    [CplanCode release], CplanCode = nil;
    [modx release], modx = nil;
    [clientId release], clientId = nil;
    [relation release], relation = nil;
    [socialInsurance release], socialInsurance = nil;
    [declareRate release], declareRate = nil;
    [wprPlan release], wprPlan = nil;
    [wprType release], wprType = nil;
    [wprYear release], wprYear = nil;
    [faceAmt release], faceAmt = nil;
    [bodyType release], bodyType = nil;
    [invsTargetPrem release], invsTargetPrem = nil;
    [firstPrem release], firstPrem = nil;
    [invsPrem release], invsPrem = nil;
    [invsDurs release], invsDurs = nil;
    [invsRate release], invsRate = nil;
    [invsBonusRate release], invsBonusRate = nil;
    [anRate release], anRate = nil;
    [anDur release], anDur = nil;
    [anAge release], anAge = nil;
    [anPrem release], anPrem = nil;
    [cityRate release], cityRate = nil;
    [periodCertain release], periodCertain = nil;
    [accuRate1 release], accuRate1 = nil;
    [accuRate2 release], accuRate2 = nil;
    [accuRate3 release], accuRate3 = nil;
    [accuRate4 release], accuRate4 = nil;
    [accuRate5 release], accuRate5 = nil;
    [accuRate6 release], accuRate6 = nil;
    [maxFaceAmt release], maxFaceAmt = nil;
    [minFaceAmt release], minFaceAmt = nil;
    [super dealloc];
}
@end
