//
//  lfAbbr.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfAbbr : NSObject
{
    NSString *planAbbrCode;
    NSString *planAbbrDesc;
    NSString *planType;
    NSString *abbrtype;
    NSInteger seq;
    NSInteger fbInd;
}
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSString *planAbbrDesc;
@property (nonatomic, retain) NSString *planType;
@property (nonatomic, retain) NSString *abbrType;
@property (nonatomic) NSInteger seq;
@property (nonatomic) NSInteger fbInd;

@end
