//
//  lfRpuInd.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfRpuInd : NSObject
{
    NSString *planCode;
    NSString *rateScale;
    NSString *planAbbrCode;
    NSString *primaryRiderInd;
    NSString *rpuInd;
    NSString *etiInd;
    NSString *pricingQx;
    NSNumber *pricingQxPerc;
    NSNumber *pricingIx;
}
@property (nonatomic, retain) NSString *planCode;
@property (nonatomic, retain) NSString *rateScale;
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSString *primaryRiderInd;
@property (nonatomic, retain) NSString *rpuInd;
@property (nonatomic, retain) NSString *etiInd;
@property (nonatomic, retain) NSString *pricingQx;
@property (nonatomic, retain) NSNumber *pricingQxPerc;
@property (nonatomic, retain) NSNumber *pricingIx;

@end
