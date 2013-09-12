//
//  lfUwAge.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfUwAge : NSObject
{
    NSString *planCode;
    NSString *rateSex;
    NSNumber *rateAgeStart;
    NSNumber *rateAgeEnd;
    NSNumber *maxAmt;
    NSNumber *minAmt;
}
@property (nonatomic, retain) NSString *planCode;
@property (nonatomic, retain) NSString *rateSex;
@property (nonatomic, retain) NSNumber *rateAgeStart;
@property (nonatomic, retain) NSNumber *rateAgeEnd;
@property (nonatomic, retain) NSNumber *maxAmt;
@property (nonatomic, retain) NSNumber *minAmt;

@end
