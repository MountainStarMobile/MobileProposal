//
//  vlPrat.h
//  MLIproposal
//
//  Created by sinss on 12/8/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface vlPrat : NSObject
{
    NSString *planCode;
    NSString *rateScale;
    NSNumber *rateAge;
    NSString *rateSex;
    NSString *rateMedi;
    NSNumber *premFactor;
}
@property (nonatomic, retain) NSString *planCode;
@property (nonatomic, retain) NSString *rateScale;
@property (nonatomic, retain) NSNumber *rateAge;
@property (nonatomic, retain) NSString *rateSex;
@property (nonatomic, retain) NSString *rateMedi;
@property (nonatomic, retain) NSNumber *premFactor;

@end
