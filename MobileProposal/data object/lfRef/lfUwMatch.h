//
//  lfUwMatch.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfUwMatch : NSObject
{
    NSString *planAbbrCode;
    NSString *uwType;
    NSString *prjSeq;
    NSString *matchPlan;
    NSString *uwMsg;
}
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSString *uwType;
@property (nonatomic, retain) NSString *prjSeq;
@property (nonatomic, retain) NSString *matchPlan;
@property (nonatomic, retain) NSString *uwMsg;

@end
