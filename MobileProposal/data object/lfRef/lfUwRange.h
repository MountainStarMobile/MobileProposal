//
//  lfUwRange.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfUwRange : NSObject
{
    NSString *planAbbrCode;
    NSNumber *seq;
    NSNumber *from;
    NSNumber *to;
    NSNumber *max;
    NSNumber *min;
    NSString *uwType;
    NSString *uwMsg;
    NSString *prjSeq;
}
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSNumber *seq;
@property (nonatomic, retain) NSNumber *from;
@property (nonatomic, retain) NSNumber *to;
@property (nonatomic, retain) NSNumber *max;
@property (nonatomic, retain) NSNumber *min;
@property (nonatomic, retain) NSString *uwType;
@property (nonatomic, retain) NSString *uwMsg;
@property (nonatomic, retain) NSString *prjSeq;

@end
