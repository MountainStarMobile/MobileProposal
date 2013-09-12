//
//  switchFunction.m
//  MobileProposal
//
//  Created by sinss on 13/1/14.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "switchFunction.h"

switchFunction *switchFunctionInstance;

@implementation switchFunction

+ (switchFunction*)switchFunctionInstance
{
    if (switchFunctionInstance == nil)
    {
        switchFunctionInstance = [switchFunction new];
    }
    return switchFunctionInstance;
}

#pragma mark 取得繳別中文
- (NSString*)GetModxDescWithModx:(NSInteger)modx
{
    NSString *modxDesc = nil;
    switch (modx)
    {
        case 0:
            modxDesc = [NSString stringWithFormat:@"躉繳"];
            break;
        case 1:
            modxDesc = [NSString stringWithFormat:@"月繳"];
            break;
        case 3:
            modxDesc = [NSString stringWithFormat:@"季繳"];
            break;
        case 6:
            modxDesc = [NSString stringWithFormat:@"半年繳"];
            break;
        case 12:
            modxDesc = [NSString stringWithFormat:@"年繳"];
            break;
        default:
            modxDesc = [NSString stringWithFormat:@"年繳"];
            break;
    }
    return modxDesc;
}

- (NSString*)GetCoverageDescWithCoverageDur:(NSNumber*)dur andCoverageAge:(NSNumber*)age
{
    NSString *desc = nil;
    if ([dur integerValue] > 0)
    {
        desc = [NSString stringWithFormat:@"保障%@年", dur];
    }
    else
    {
        if ([age integerValue] == 105 || [age integerValue] == 100)
        {
            desc = [NSString stringWithFormat:@"保障終身"];
        }
        else
        {
            desc = [NSString stringWithFormat:@"保障到%@歲", age];
        }
    }
    return desc;
}

#pragma mark 性別
- (NSString*)GetSexDesc:(NSString*)sex
{
    NSString *desc = nil;
    if ([sex isEqualToString:@"1"])
    {
        desc = [NSString stringWithFormat:@"男"];
    }
    else if ([sex isEqualToString:@"2"])
    {
        desc = [NSString stringWithFormat:@"女"];
    }
    return desc;
}

- (NSString*)GetCustomerFieldNameWithInputKey:(NSString*)key
{
    NSString *desc = nil;
    if ([key isEqualToString:customerNameKey])
    {
        desc = [NSString stringWithFormat:@"姓名"];
    }
    else if ([key isEqualToString:customerNickNameKey])
    {
        desc = [NSString stringWithFormat:@"暱稱"];
    }
    else if ([key isEqualToString:customerCellKey])
    {
        desc = [NSString stringWithFormat:@"手機"];
    }
    else if ([key isEqualToString:customerTel1Key])
    {
        desc = [NSString stringWithFormat:@"住家電話"];
    }
    else if ([key isEqualToString:customerTel2Key])
    {
        desc = [NSString stringWithFormat:@"公司電話"];
    }
    else if ([key isEqualToString:customerEmailKey])
    {
        desc = [NSString stringWithFormat:@"電子郵件"];
    }
    else if ([key isEqualToString:customerSexKey])
    {
        desc = [NSString stringWithFormat:@"性別"];
    }
    else if ([key isEqualToString:customerBirthdayKey])
    {
        desc = [NSString stringWithFormat:@"生日"];
    }
    else if ([key isEqualToString:customerZipKey])
    {
        desc = [NSString stringWithFormat:@"郵遞區號"];
    }
    else if ([key isEqualToString:customerAddressKey])
    {
        desc = [NSString stringWithFormat:@"住家地址"];
    }
    else if ([key isEqualToString:customerOccuCodeKey])
    {
        desc = [NSString stringWithFormat:@"職業代碼"];
    }
    else if ([key isEqualToString:customerOccuLevelKey])
    {
        desc = [NSString stringWithFormat:@"職業等級"];
    }
    else if ([key isEqualToString:customerFeeKey])
    {
        desc = [NSString stringWithFormat:@"職業加費"];
    }
    else if ([key isEqualToString:customerFacebookKey])
    {
        desc = [NSString stringWithFormat:@"臉書"];
    }
    else if ([key isEqualToString:customerGooglePlusKey])
    {
        desc = [NSString stringWithFormat:@"Google+"];
    }
    return desc;
}

- (NSString*)GetCustomerRelationNameWithKey:(NSString*)key
{
    NSString *desc = nil;
    if ([key isEqualToString:CMRelationParentKey])
    {
        desc = [NSString stringWithFormat:@"父母"];
    }
    else if ([key isEqualToString:CMRelationChildrenKey])
    {
        desc = [NSString stringWithFormat:@"小孩"];
    }
    else if ([key isEqualToString:CMRelationManagerKey])
    {
        desc = [NSString stringWithFormat:@"主管"];
    }
    else if ([key isEqualToString:CMRelationSubordinatorKey])
    {
        desc = [NSString stringWithFormat:@"下屬"];
    }
    else if ([key isEqualToString:CMRelationBrotherKey])
    {
        desc = [NSString stringWithFormat:@"兄弟"];
    }
    else if ([key isEqualToString:CMRelationSisterKey])
    {
        desc = [NSString stringWithFormat:@"姐妹"];
    }
    else if ([key isEqualToString:CMRelationFriendKey])
    {
        desc = [NSString stringWithFormat:@"朋友"];
    }
    else if ([key isEqualToString:CMRelationCoupleKey])
    {
        desc = [NSString stringWithFormat:@"配偶"];
    }
    else if ([key isEqualToString:CMRelationLoverKey])
    {
        desc = [NSString stringWithFormat:@"情侶"];
    }
    else if ([key isEqualToString:CMRelationColleagueKey])
    {
        desc = [NSString stringWithFormat:@"同事"];
    }
    return desc;
}

#pragma mark 主/附約
- (NSString*)GetPlanCategoryNameWithIndex:(NSInteger)row
{
    NSString *desc = nil;
    if (row == 0)
    {
        desc = [NSString stringWithFormat:planCategoryMain];
    }
    if (row == 1)
    {
        desc = [NSString stringWithFormat:planCategoryElse];
    }
    return desc;
}
- (NSString*)GetPlanCategoryNameWithKey:(NSString*)key
{
    NSString *desc = nil;
    if ([key isEqualToString:planCategoryMain])
    {
        desc = [NSString stringWithFormat:@"主約"];
    }
    else if ([key isEqualToString:planCategoryElse])
    {
        desc = [NSString stringWithFormat:@"附約"];
    }
    return desc;
}

- (NSString*)GetPlanTypeNameWithPlanType:(NSString*)planType
{
    NSString *desc = nil;
    if ([planType isEqualToString:@"L"])
    {
        desc = [NSString stringWithFormat:@"壽險主約商品"];
    }
    else if ([planType isEqualToString:@"R"])
    {
        desc = [NSString stringWithFormat:@"壽險附約商品"];
    }
    else if ([planType isEqualToString:@"A"])
    {
        desc = [NSString stringWithFormat:@"傷害險商品"];
    }
    else if ([planType isEqualToString:@"M"])
    {
        desc = [NSString stringWithFormat:@"醫療險商品"];
    }
    else if ([planType isEqualToString:@"C"])
    {
        desc = [NSString stringWithFormat:@"防癌險商品"];
    }
    else if ([planType isEqualToString:@"V"])
    {
        desc = [NSString stringWithFormat:@"投資型商品"];
    }
    else if ([planType isEqualToString:@"An"])
    {
        desc = [NSString stringWithFormat:@"年金型商品"];
    }
    return desc;
}

- (NSString*)GetSelectPlanAidNameWithKey:(NSString*)key
{
    NSString *desc = nil;
    if ([key isEqualToString:input_relation])
    {
        desc = [NSString stringWithFormat:@"對象"];
    }
    else if ([key isEqualToString:selectPlanCategory])
    {
        desc = [NSString stringWithFormat:@"主/附約"];
    }
    if ([key isEqualToString:selectPlanTypeKey])
    {
        desc = [NSString stringWithFormat:@"商品類型"];
    }
    else if ([key isEqualToString:selectPlanAbbrKey])
    {
        desc = [NSString stringWithFormat:@"商品名稱"];
    }
    else if ([key isEqualToString:selectPlanAidKey])
    {
        desc = [NSString stringWithFormat:@"商品計畫別"];
    }
    else if ([key isEqualToString:selectPlanCodeOrderKey])
    {
        desc = [NSString stringWithFormat:@"險種計畫別"];
    }
    else if ([key isEqualToString:selectPlanCodeKey])
    {
        desc = [NSString stringWithFormat:@"險種代碼"];
    }
    return desc;
}

- (NSString*)GetWprDescWithWprType:(NSInteger)wprType
{
    NSString *desc = nil;
    switch (wprType)
    {
        case 0:
            desc = [NSString stringWithFormat:@"無豁免"];
            break;
        case 1:
            desc = [NSString stringWithFormat:@"主約豁免"];
            break;
        case 2:
            desc = [NSString stringWithFormat:@"主附約豁免"];
            break;
    }
    return desc;
}

- (NSString*)GetRelationNameWithKey:(NSString*)relation
{
    NSString *desc = nil;
    if ([relation isEqualToString:relationI1])
    {
        desc = [NSString stringWithFormat:@"被保險人"];
    }
    else if ([relation isEqualToString:relationO1])
    {
        desc = [NSString stringWithFormat:@"要保人"];
    }
    else if ([relation isEqualToString:relationSS])
    {
        desc = [NSString stringWithFormat:@"配偶"];
    }
    else
    {
        desc = [NSString stringWithFormat:@"子女"];
    }
    return desc;
}

- (NSString*)GetInputName:(NSString*)inputKey andProposalType:(NSString*)proposalType
{
    NSString *desc = nil;
    if ([inputKey isEqualToString:input_modx])
    {
        desc = [NSString stringWithFormat:@"繳別"];
    }
    else if ([inputKey isEqualToString:input_relation])
    {
        desc = [NSString stringWithFormat:@"對象"];
    }
    else if ([inputKey isEqualToString:input_faceamt])
    {
        desc = [NSString stringWithFormat:@"保額"];
    }
    else if ([inputKey isEqualToString:input_socialInsurance])
    {
        desc = [NSString stringWithFormat:@"社會保險"];
    }
    else if ([inputKey isEqualToString:input_declareRate])
    {
        desc = [NSString stringWithFormat:@"宣告利率"];
    }
    else if ([inputKey isEqualToString:input_wprPlan])
    {
        desc = [NSString stringWithFormat:@"豁免計畫"];
    }
    else if ([inputKey isEqualToString:input_wprType])
    {
        desc = [NSString stringWithFormat:@"豁免類型"];
    }
    else if ([inputKey isEqualToString:input_wprYear])
    {
        desc = [NSString stringWithFormat:@"豁免年期"];
    }
    else if ([inputKey isEqualToString:input_invsTargetPrem])
    {
        desc = [NSString stringWithFormat:@"繳別保費"];
    }
    else if ([inputKey isEqualToString:input_firstPrem])
    {
        desc = [NSString stringWithFormat:@"第一次實繳保險費"];
    }
    else if ([inputKey isEqualToString:input_invsPrem])
    {
        desc = [NSString stringWithFormat:@"定期保險費"];
    }
    else if ([inputKey isEqualToString:input_invsDurs])
    {
        desc = [NSString stringWithFormat:@"續繳年期"];
    }
    else if ([inputKey isEqualToString:input_invsRate])
    {
        if ([proposalType isEqualToString:proposalType_ul])
        {
            desc = [NSString stringWithFormat:@"宣告利率"];
        }
        else
        {
            desc = [NSString stringWithFormat:@"投資報酬率"];
        }
    }
    else if ([inputKey isEqualToString:input_invsBonusRate])
    {
        desc = [NSString stringWithFormat:@"標的配息率"];
    }
    else if ([inputKey isEqualToString:input_bodyType])
    {
        desc = [NSString stringWithFormat:@"體位"];
    }
    else if ([inputKey isEqualToString:input_anRate])
    {
        desc = [NSString stringWithFormat:@"年金化預定利率"];
    }
    else if ([inputKey isEqualToString:input_anAge])
    {
        desc = [NSString stringWithFormat:@"年金化年齡"];
    }
    else if ([inputKey isEqualToString:input_anDur])
    {
        desc = [NSString stringWithFormat:@"年金化年度"];
    }
    else if ([inputKey isEqualToString:input_anPrem])
    {
        desc = [NSString stringWithFormat:@"投保保費"];
    }
    else if ([inputKey isEqualToString:input_cityRate])
    {
        desc = [NSString stringWithFormat:@"連結標的成長率"];
    }
    else if ([inputKey isEqualToString:input_periodCertain])
    {
        desc = [NSString stringWithFormat:@"保證期間"];
    }
    else if ([inputKey isEqualToString:input_anAccuRate1])
    {
        desc = [NSString stringWithFormat:@"利率1"];
    }
    else if ([inputKey isEqualToString:input_anAccuRate2])
    {
        desc = [NSString stringWithFormat:@"利率2"];
    }
    else if ([inputKey isEqualToString:input_anAccuRate3])
    {
        desc = [NSString stringWithFormat:@"利率3"];
    }
    else if ([inputKey isEqualToString:input_anAccuRate4])
    {
        desc = [NSString stringWithFormat:@"利率4"];
    }
    else if ([inputKey isEqualToString:input_anAccuRate5])
    {
        desc = [NSString stringWithFormat:@"利率5"];
    }
    else if ([inputKey isEqualToString:input_anAccuRate6])
    {
        desc = [NSString stringWithFormat:@"利率6"];
    }
    else
    {
        desc = [NSString stringWithFormat:@"key 不正確"];
    }
    return desc;
}

#pragma mark 取得保額單位中文
- (NSString*)GetFaceAmtUnit:(NSInteger)unitValue andFaceAmtType:(NSString*)faceAmtType
{
    NSString *desc = nil;
    if ([faceAmtType isEqualToString:@"2"])
    {
        desc = [NSString stringWithFormat:@"單位"];
    }
    else
    {
        switch (unitValue)
        {
            case 10000:
                desc = [NSString stringWithFormat:@"萬"];
                break;
            case 1000:
                desc = [NSString stringWithFormat:@"仟"];
                break;
            case 10:
            case 100:
                desc = [NSString stringWithFormat:@"佰"];
                break;
            default:
                desc = [NSString stringWithFormat:@"單位"];
                break;
        }
    }
    return desc;
}

@end
