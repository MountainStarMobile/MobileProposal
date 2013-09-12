//
//  lfSa.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/25.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfSa : NSObject
{
    NSString *saPlanCode;
    NSString *saRateScale;
    NSNumber *age;
    NSNumber *durs;
    NSString *saFactor;
}
@property (nonatomic, retain) NSString *saPlanCode;
@property (nonatomic, retain) NSString *saRateScale;
@property (nonatomic, retain) NSNumber *age;
@property (nonatomic, retain) NSNumber *durs;
@property (nonatomic, retain) NSString *saFactor;

@end
