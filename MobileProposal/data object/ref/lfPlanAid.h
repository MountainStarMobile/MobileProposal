//
//  lfPlanAid.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfPlanAid : NSObject
{
    NSString *planType;
    NSString *planAbbrCode;
    NSString *planAbbrDesc;
    NSInteger periodOrder;
    NSString *periodDesc;
    NSInteger planCodeOrder;
    NSString *planCodeDesc;
    NSString *IPlanCode;
    NSString *SPlanCode;
    NSString *CPlanCode;
}
@property (nonatomic, retain) NSString *planType;
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSString *planAbbrDesc;
@property (nonatomic,) NSInteger periodOrder;
@property (nonatomic, retain) NSString *periodDesc;
@property (nonatomic,) NSInteger planCodeOrder;
@property (nonatomic, retain) NSString *planCodeDesc;
@property (nonatomic, retain) NSString *IPlanCode;
@property (nonatomic, retain) NSString *SPlanCode;
@property (nonatomic, retain) NSString *CPlanCode;

@end
