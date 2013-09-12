//
//  switchFunction.h
//  MobileProposal
//
//  Created by sinss on 13/1/14.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface switchFunction : NSObject

+ (switchFunction*)switchFunctionInstance;

- (NSString*)GetModxDescWithModx:(NSInteger)modx;
- (NSString*)GetCoverageDescWithCoverageDur:(NSNumber*)dur andCoverageAge:(NSNumber*)age;
- (NSString*)GetSexDesc:(NSString*)sex;
- (NSString*)GetCustomerFieldNameWithInputKey:(NSString*)key;
- (NSString*)GetCustomerRelationNameWithKey:(NSString*)key;

- (NSString*)GetPlanCategoryNameWithIndex:(NSInteger)row;
- (NSString*)GetPlanCategoryNameWithKey:(NSString*)key;
- (NSString*)GetPlanTypeNameWithPlanType:(NSString*)planType;
- (NSString*)GetSelectPlanAidNameWithKey:(NSString*)key;
- (NSString*)GetWprDescWithWprType:(NSInteger)wprType;
- (NSString*)GetRelationNameWithKey:(NSString*)relation;

- (NSString*)GetInputName:(NSString*)inputKey andProposalType:(NSString*)proposalType;
- (NSString*)GetFaceAmtUnit:(NSInteger)unitValue andFaceAmtType:(NSString*)faceAmtType;

@end
