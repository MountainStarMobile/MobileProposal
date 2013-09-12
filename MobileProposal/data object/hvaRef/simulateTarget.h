//
//  simulateTarget.h
//  MLIproposal
//
//  Created by sinss on 12/8/26.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface simulateTarget : NSObject
{
    NSString *invsCode;
    NSString *invsName;
    NSString *issueDate;
    NSString *startDate;
    NSString *currency;
    NSString *currencyName;
    NSString *currencyUnit;
    NSNumber *targetType;
    NSNumber *invsType;
    NSNumber *seq;
}
@property (nonatomic, retain) NSString *invsCode;
@property (nonatomic, retain) NSString *invsName;
@property (nonatomic, retain) NSString *issueDate;
@property (nonatomic, retain) NSString *startDate;
@property (nonatomic, retain) NSString *currency;
@property (nonatomic, retain) NSString *currencyName;
@property (nonatomic, retain) NSString *currencyUnit;
@property (nonatomic, retain) NSNumber *targetType;
@property (nonatomic, retain) NSNumber *invsType;
@property (nonatomic, retain) NSNumber *seq;

@end
