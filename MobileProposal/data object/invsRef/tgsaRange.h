//
//  tgsaRange.h
//  MLIproposal
//
//  Created by 張星星 on 12/6/15.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tgsaRange : NSObject
{
    NSString *planCode;
    NSString *rateScale;
    NSString *rateSex;
    NSNumber *rateAge;
    NSNumber *minRate;
    NSNumber *maxRate;
}
@property (nonatomic, retain) NSString *planCode;
@property (nonatomic, retain) NSString *rateScale;
@property (nonatomic, retain) NSString *rateSex;
@property (nonatomic, retain) NSNumber *rateAge;
@property (nonatomic, retain) NSNumber *minRate;
@property (nonatomic, retain) NSNumber *maxRate;

@end
