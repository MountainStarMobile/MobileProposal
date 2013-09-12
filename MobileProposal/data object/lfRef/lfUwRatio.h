//
//  lfUwRatio.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfUwRatio : NSObject
{
    NSString *planAbbrCode;
    NSNumber *planAmt;
    NSString *uwType;
    NSString *ratioPlan;
    NSNumber *ratio;
    NSString *uwMsg;
}
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSNumber *planAmt;
@property (nonatomic, retain) NSString *uwType;
@property (nonatomic, retain) NSString *ratioPlan;
@property (nonatomic, retain) NSNumber *ratio;
@property (nonatomic, retain) NSString *uwMsg;
@end
