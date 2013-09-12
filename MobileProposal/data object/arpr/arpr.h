//
//  arpr.h
//  MLIproposal
//
//  Created by sinss on 12/8/3.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface arpr : NSObject
{
    NSString *prPlanCode;
    NSString *prRateScale;
    NSString *sex;
    NSNumber *age;
    NSNumber *dur;
    NSNumber *pvUnitValue;
    NSNumber *cvUnitValue;
    NSNumber *rpuFactor;
    NSNumber *cpFactor;
}
@property (nonatomic, retain) NSString *prPlanCode;
@property (nonatomic, retain) NSString *prRateScale;
@property (nonatomic, retain) NSString *sex;
@property (nonatomic, retain) NSNumber *age;
@property (nonatomic, retain) NSNumber *dur;
@property (nonatomic, retain) NSNumber *pvUnitValue;
@property (nonatomic, retain) NSNumber *cvUnitValue;
@property (nonatomic, retain) NSNumber *rpuFactor;
@property (nonatomic, retain) NSNumber *cpFactor;
@end
