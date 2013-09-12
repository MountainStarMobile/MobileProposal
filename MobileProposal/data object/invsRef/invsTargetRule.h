//
//  invsTargetRule.h
//  MLIproposal
//
//  Created by sinss on 12/11/5.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface invsTargetRule : NSObject
{
    NSString *planAbbrCode;
    NSNumber *minTarget;
    NSNumber *maxTarget;
    NSString *ratePlanCode;
}
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSNumber *minTarget;
@property (nonatomic, retain) NSNumber *maxTarget;
@property (nonatomic, retain) NSString *ratePlanCode;

@end
