//
//  planAid.h
//  MLIproposal
//
//  Created by 張星星 on 12/2/16.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface planAid : NSObject
{
    NSString *planType;
    NSString *planAbbrCode;
    NSString *planAbbrDesc;
    NSNumber *periodOrder;
    NSString *periodDesc;
    NSNumber *planCodeOrder;
    NSString *planCodeDesc;
    NSString *IPlanCode;
    NSString *SPlanCode;
    NSString *CPlanCode;
    NSString *proposalType;
    NSNumber *companyCode;
    NSNumber *brokerCode;
}
@property (nonatomic, retain) NSString *planType;
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSString *planAbbrDesc;
@property (nonatomic, retain) NSNumber *periodOrder;
@property (nonatomic, retain) NSString *periodDesc;
@property (nonatomic, retain) NSNumber *planCodeOrder;
@property (nonatomic, retain) NSString *planCodeDesc;
@property (nonatomic, retain) NSString *IPlanCode;
@property (nonatomic, retain) NSString *SPlanCode;
@property (nonatomic, retain) NSString *CPlanCode;
@property (nonatomic, retain) NSString *proposalType;
@property (nonatomic, retain) NSNumber *companyCode;
@property (nonatomic, retain) NSNumber *brokerCode;

@end
