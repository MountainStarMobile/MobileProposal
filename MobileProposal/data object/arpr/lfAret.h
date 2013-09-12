//
//  lfAret.h
//  MLIproposal
//
//  Created by sinss on 12/8/3.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfAret : NSObject
{
    NSString *pricingQx;
    NSNumber *pricingQxPerc;
    NSNumber *pricingIx;
    NSString *sex;
    NSNumber *age;
    NSNumber *etiYear;
    NSNumber *etiFactorT0;
    NSNumber *etiFactorT1;
    NSNumber *etiPeFactorT0;
    NSNumber *etiPeFactorT1;
}
@property (nonatomic, retain) NSString *pricingQx;
@property (nonatomic, retain) NSNumber *pricingQxPerc;
@property (nonatomic, retain) NSNumber *pricingIx;
@property (nonatomic, retain) NSString *sex;
@property (nonatomic, retain) NSNumber *age;
@property (nonatomic, retain) NSNumber *etiYear;
@property (nonatomic, retain) NSNumber *etiFactorT0;
@property (nonatomic, retain) NSNumber *etiFactorT1;
@property (nonatomic, retain) NSNumber *etiPeFactorT0;
@property (nonatomic, retain) NSNumber *etiPeFactorT1;

@end
