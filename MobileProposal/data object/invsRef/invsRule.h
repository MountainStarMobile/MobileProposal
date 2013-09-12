//
//  invsRule.h
//  MLIproposal
//
//  Created by sinss on 12/8/17.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface invsRule : NSObject
{
    NSString *planType;
    NSNumber *start;
    NSNumber *end;
    NSNumber *factor;
}
@property (nonatomic, retain) NSString *planType;
@property (nonatomic, retain) NSNumber *start;
@property (nonatomic, retain) NSNumber *end;
@property (nonatomic, retain) NSNumber *factor;

@end
