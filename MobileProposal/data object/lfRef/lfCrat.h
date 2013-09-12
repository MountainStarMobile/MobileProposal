//
//  lfCrat.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfCrat : NSObject
{
    NSString *commPlanCode;
    NSString *commRateScale;
    NSNumber *premYearStart;
    NSNumber *premYearEnd;
    NSNumber *insuAgeStart;
    NSNumber *insuAgeEnd;
    NSNumber *commRate;
}
@property (nonatomic, retain) NSString *commPlanCode;
@property (nonatomic, retain) NSString *commRateScale;
@property (nonatomic, retain) NSNumber *premYearStart;
@property (nonatomic, retain) NSNumber *premYearEnd;
@property (nonatomic, retain) NSNumber *insuAgeStart;
@property (nonatomic, retain) NSNumber *insuAgeEnd;
@property (nonatomic, retain) NSNumber *commRate;
@end
