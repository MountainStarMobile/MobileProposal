//
//  lfPv.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/25.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfPv : NSObject
{
    NSString *prPlanCode;
    NSString *prRateScale;
    NSNumber *age;
    NSString *sex;
    NSNumber *durs;
    NSString *pvUnitValue;
}
@property (nonatomic, retain) NSString *prPlanCode;
@property (nonatomic, retain) NSString *prRateScale;
@property (nonatomic, retain) NSNumber *age;
@property (nonatomic, retain) NSString *sex;
@property (nonatomic, retain) NSNumber *durs;
@property (nonatomic, retain) NSString *pvUnitValue;
@end
