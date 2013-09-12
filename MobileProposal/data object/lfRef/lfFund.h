//
//  lfFund.h
//  MLIproposal
//
//  Created by 張星星 on 12/6/24.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfFund : NSObject
{
    NSString *planDesc;
    NSNumber *seq;
    NSString *itemType;
    NSString *itemDesc;
    NSString *itemValue;
    NSString *valueLimit;
    NSString *valueType;
}
@property (nonatomic, retain) NSString *planDesc;
@property (nonatomic, retain) NSNumber *seq;
@property (nonatomic, retain) NSString *itemType;
@property (nonatomic, retain) NSString *itemDesc;
@property (nonatomic, retain) NSString *itemValue;
@property (nonatomic, retain) NSString *valueLimit;
@property (nonatomic, retain) NSString *valueType;

@end
