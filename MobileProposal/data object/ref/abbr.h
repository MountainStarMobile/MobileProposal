//
//  abbr.h
//  MLIproposal
//
//  Created by 張星星 on 12/2/16.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface abbr : NSObject
{
    NSString *planAbbrCode;
    NSString *planAbbrDesc;
    NSString *planType;
    NSString *abbrType;
    NSNumber *seq;
    NSString *fbInd;
    NSString *proposalType;
    NSNumber *companyCode;
    NSNumber *brokerCode;
}
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSString *planAbbrDesc;
@property (nonatomic, retain) NSString *planType;
@property (nonatomic, retain) NSString *abbrType;
@property (nonatomic, retain) NSNumber *seq;
@property (nonatomic, retain) NSString *fbInd;
@property (nonatomic, retain) NSString *proposalType;
@property (nonatomic, retain) NSNumber *companyCode;
@property (nonatomic, retain) NSNumber *brokerCode;

@end
