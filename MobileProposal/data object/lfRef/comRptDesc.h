//
//  comRptDesc.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface comRptDesc : NSObject
{
    NSNumber *rptNo;
    NSString *secName;
    NSNumber *msgType;
    NSString *desc01;
    NSString *desc02;
    NSString *desc03;
    NSString *desc04;
    NSString *desc05;
    NSNumber *seq;
}
@property (nonatomic, retain) NSNumber *rptNo;
@property (nonatomic, retain) NSString *secName;
@property (nonatomic, retain) NSNumber *msgType;
@property (nonatomic, retain) NSString *desc01;
@property (nonatomic, retain) NSString *desc02;
@property (nonatomic, retain) NSString *desc03;
@property (nonatomic, retain) NSString *desc04;
@property (nonatomic, retain) NSString *desc05;
@property (nonatomic, retain) NSNumber *seq;

@end
