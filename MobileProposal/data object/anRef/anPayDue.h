//
//  anPayDue.h
//  MLIproposal
//
//  Created by sinss on 12/9/4.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface anPayDue : NSObject
{
    NSString *planCode;
    NSString *rateScale;
    NSNumber *age;
    NSString *sex;
    NSNumber *dur;
    NSNumber *anPricingIx;
    NSNumber *aDue;
}
@property (nonatomic, retain) NSString *planCode;
@property (nonatomic, retain) NSString *rateScale;
@property (nonatomic, retain) NSNumber *age;
@property (nonatomic, retain) NSString *sex;
@property (nonatomic, retain) NSNumber *dur;
@property (nonatomic, retain) NSNumber *anPricingIx;
@property (nonatomic, retain) NSNumber *aDue;

@end
