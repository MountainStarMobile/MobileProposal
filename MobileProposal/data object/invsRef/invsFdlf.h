//
//  invsFdlf.h
//  MLIproposal
//
//  Created by sinss on 12/8/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface invsFdlf : NSObject
{
    NSString *feldPtr;
    NSString *feldType;
    NSString *expnReasonCode;
    NSNumber *poYearFrom;
    NSNumber *poYearTo;
    NSString *feldCalcInd;
    NSNumber *feldCalcRef;
    NSString *feldBaseInd;
}
@property (nonatomic, retain) NSString *feldPtr;
@property (nonatomic, retain) NSString *feldType;
@property (nonatomic, retain) NSString *expnReasonCode;
@property (nonatomic, retain) NSNumber *poYearFrom;
@property (nonatomic, retain) NSNumber *poYearTo;
@property (nonatomic, retain) NSString *feldCalcInd;
@property (nonatomic, retain) NSNumber *feldCalcRef;
@property (nonatomic, retain) NSString *feldBaseInd;

@end
