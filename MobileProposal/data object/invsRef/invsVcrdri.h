//
//  invsVcrdri.h
//  MLIproposal
//
//  Created by sinss on 12/8/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface invsVcrdri : NSObject
{
    NSString *planCode;
    NSString *rateScale;
    NSNumber *start;
    NSNumber *end;
    NSNumber *factorRate;
}
@property (nonatomic, retain) NSString *planCode;
@property (nonatomic, retain) NSString *rateScale;
@property (nonatomic, retain) NSNumber *start;
@property (nonatomic, retain) NSNumber *end;
@property (nonatomic, retain) NSNumber *factorRate;

@end
