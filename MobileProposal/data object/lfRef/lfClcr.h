//
//  lfClcr.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/13.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfClcr : NSObject
{
    NSString *planCode;
    NSString *rateScale;
    NSString *clItem;
    NSNumber *claimAmt;
}
@property (nonatomic, retain) NSString *planCode;
@property (nonatomic, retain) NSString *rateScale;
@property (nonatomic, retain) NSString *clItem;
@property (nonatomic, retain) NSNumber *claimAmt;

@end
