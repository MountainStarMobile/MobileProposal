//
//  invsArep.h
//  MLIproposal
//
//  Created by sinss on 12/8/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface invsArep : NSObject
{
    NSString *planCode;
    NSString *rateScale;
    NSString *rateSex;
    NSNumber *rateAge;
    NSNumber *fee;
}
@property (nonatomic, retain) NSString *planCode;
@property (nonatomic, retain) NSString *rateScale;
@property (nonatomic, retain) NSString *rateSex;
@property (nonatomic, retain) NSNumber *rateAge;
@property (nonatomic, retain) NSNumber *fee;

@end
