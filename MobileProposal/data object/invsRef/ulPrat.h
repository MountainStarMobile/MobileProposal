//
//  ulPrat.h
//  MLIproposal
//
//  Created by sinss on 12/8/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ulPrat : NSObject
{
    NSString *planCode;
    NSString *rateScale;
    NSNumber *rateAge;
    NSNumber *rateDur;
    NSString *rateSex;
    NSString *rateOccu;
    NSString *rateInsu;
    NSString *rateUnit;
    NSNumber *premFactor;
}
@property (nonatomic, retain) NSString *planCode;
@property (nonatomic, retain) NSString *rateScale;
@property (nonatomic, retain) NSNumber *rateAge;
@property (nonatomic, retain) NSNumber *rateDur;
@property (nonatomic, retain) NSString *rateSex;
@property (nonatomic, retain) NSString *rateOccu;
@property (nonatomic, retain) NSString *rateInsu;
@property (nonatomic, retain) NSString *rateUnit;
@property (nonatomic, retain) NSNumber *premFactor;

@end
