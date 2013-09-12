//
//  inputRecord.h
//  MLIproposal
//
//  Created by 張星星 on 12/6/11.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface inputRecord : NSObject
{
    NSNumber *planCategory;
    NSString *planType;
    NSString *planAbbr;
    NSString *planAbbrDesc;
    NSNumber *planOrder;
    NSString *planOrderDesc;
    NSNumber *planCodeOrder;
    NSString *planCodeOrderDesc;
    NSString *IplanCode;
    NSString *SplanCode;
    NSString *CplanCode;
    NSNumber *modx;
    NSString *clientId;
    NSString *relation;
    NSUInteger relationIndex;
    NSString *socialInsurance;
    NSNumber *declareRate;
    NSString *wprPlan;
    NSNumber *wprType;
    NSNumber *wprYear;
    NSNumber *faceAmt;
    NSString *bodyType;
    NSNumber *invsTargetPrem;
    NSNumber *firstPrem;
    NSNumber *invsPrem;
    NSNumber *invsDurs;
    NSNumber *invsRate;
    NSNumber *invsBonusRate;
    NSNumber *anRate;
    NSNumber *anDur;
    NSNumber *anAge;
    NSNumber *anPrem;
    NSNumber *cityRate;
    NSNumber *periodCertain;
    NSNumber *accuRate1;
    NSNumber *accuRate2;
    NSNumber *accuRate3;
    NSNumber *accuRate4;
    NSNumber *accuRate5;
    NSNumber *accuRate6;
    //擴充欄位
    NSNumber *maxFaceAmt;
    NSNumber *minFaceAmt;
}

@property (nonatomic, retain) NSNumber *planCategory;
@property (nonatomic, retain) NSString *planType;
@property (nonatomic, retain) NSString *planAbbr;
@property (nonatomic, retain) NSString *planAbbrDesc;
@property (nonatomic, retain) NSNumber *planOrder;
@property (nonatomic, retain) NSNumber *planCodeOrder;
@property (nonatomic, retain) NSString *planOrderDesc;
@property (nonatomic, retain) NSString *planCodeOrderDesc;
@property (nonatomic, retain) NSString *IplanCode;
@property (nonatomic, retain) NSString *SplanCode;
@property (nonatomic, retain) NSString *CplanCode;
@property (nonatomic, retain) NSNumber *modx;
@property (nonatomic, retain) NSString *clientId;
@property (nonatomic, retain) NSString *relation;
@property (nonatomic) NSUInteger relationIndex;
@property (nonatomic, retain) NSString *socialInsurance;
@property (nonatomic, retain) NSNumber *declareRate;
@property (nonatomic, retain) NSString *wprPlan;
@property (nonatomic, retain) NSNumber *wprType;
@property (nonatomic, retain) NSNumber *wprYear;
@property (nonatomic, retain) NSNumber *faceAmt;
@property (nonatomic, retain) NSString *bodyType;
@property (nonatomic, retain) NSNumber *invsTargetPrem;
@property (nonatomic, retain) NSNumber *firstPrem;
@property (nonatomic, retain) NSNumber *invsPrem;
@property (nonatomic, retain) NSNumber *invsDurs;
@property (nonatomic, retain) NSNumber *invsRate;
@property (nonatomic, retain) NSNumber *invsBonusRate;
@property (nonatomic, retain) NSNumber *anRate;
@property (nonatomic, retain) NSNumber *anDur;
@property (nonatomic, retain) NSNumber *anAge;
@property (nonatomic, retain) NSNumber *anPrem;
@property (nonatomic, retain) NSNumber *cityRate;
@property (nonatomic, retain) NSNumber *periodCertain;
@property (nonatomic, retain) NSNumber *accuRate1;
@property (nonatomic, retain) NSNumber *accuRate2;
@property (nonatomic, retain) NSNumber *accuRate3;
@property (nonatomic, retain) NSNumber *accuRate4;
@property (nonatomic, retain) NSNumber *accuRate5;
@property (nonatomic, retain) NSNumber *accuRate6;
@property (nonatomic, retain) NSNumber *maxFaceAmt;
@property (nonatomic, retain) NSNumber *minFaceAmt;

@end
