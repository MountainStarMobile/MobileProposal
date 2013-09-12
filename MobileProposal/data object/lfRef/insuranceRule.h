//
//  insuranceRule.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface insuranceRule : NSObject
{
    NSString *type;
    NSString *planAbbrCode;
    NSNumber *seq;
}
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSNumber *seq;

@end
