//
//  invsCoi.h
//  MLIproposal
//
//  Created by sinss on 12/8/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface invsCoi : NSObject
{
    NSString *planCode;
    NSString *rateScale;
    NSString *planAbbrCode;
    NSNumber *ageDur;
    NSString *sex;
    NSString *rateMedi;
    NSString *rateOccu;
    NSNumber *coiFactor;
}

@property (nonatomic, retain) NSString *planCode;
@property (nonatomic, retain) NSString *rateScale;
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSNumber *ageDur;
@property (nonatomic, retain) NSString *sex;
@property (nonatomic, retain) NSString *rateMedi;
@property (nonatomic, retain) NSString *rateOccu;
@property (nonatomic, retain) NSNumber *coiFactor;

@end
