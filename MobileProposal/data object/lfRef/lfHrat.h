//
//  lfHrat.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfHrat : NSObject
{
    NSString *planAbbrCode;
    NSString *rateScale;
    NSNumber *premStart;
    NSNumber *premEnd;
    NSNumber *durStart;
    NSNumber *durEnd;
    NSNumber *discPerc;
}
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSString *rateScale;
@property (nonatomic, retain) NSNumber *premStart;
@property (nonatomic, retain) NSNumber *premEnd;
@property (nonatomic, retain) NSNumber *durStart;
@property (nonatomic, retain) NSNumber *durEnd;
@property (nonatomic, retain) NSNumber *discPerc;

@end
