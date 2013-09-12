//
//  tgsaAmtRange.h
//  MLIproposal
//
//  Created by 張星星 on 12/6/15.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tgsaAmtRange : NSObject
{
    NSString *planCode;
    NSNumber *targetPrme;
    NSNumber *minAmt;
    NSNumber *maxAmt;
}
@property (nonatomic, retain) NSString *planCode;
@property (nonatomic, retain) NSNumber *targetPrem;
@property (nonatomic, retain) NSNumber *minAmt;
@property (nonatomic, retain) NSNumber *maxAmt;

@end
