//
//  arsaInfo.h
//  MLIproposal
//
//  Created by sinss on 12/9/27.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface arsaInfo : NSObject
{
    NSString *planCode;
    NSString *rateScale;
    NSNumber *age;
    NSNumber *dur;
    NSNumber *saFactor;
    NSNumber *addFactor;
}

@property (nonatomic, retain) NSString *planCode;
@property (nonatomic, retain) NSString *rateScale;
@property (nonatomic, retain) NSNumber *age;
@property (nonatomic, retain) NSNumber *dur;
@property (nonatomic, retain) NSNumber *saFactor;
@property (nonatomic, retain) NSNumber *addFactor;

@end
