//
//  insuranceProvisionInfo.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/21.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//
/*
 商品條款類別  table:InsuranceProvision
 */
#import <Foundation/Foundation.h>

@interface insuranceProvisionInfo : NSObject
{
    NSString *planAbbrCode;
    NSString *planAbbrDesc;
    NSString *planType;
    NSString *abbrType;
    NSNumber *seq;
    NSString *fileName;
    NSString *declareInd;
}
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSString *planAbbrDesc;
@property (nonatomic, retain) NSString *planType;
@property (nonatomic, retain) NSString *abbrType;
@property (nonatomic, retain) NSNumber *seq;
@property (nonatomic, retain) NSString *fileName;
@property (nonatomic, retain) NSString *declareInd;

@end
