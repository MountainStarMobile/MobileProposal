//
//  ulVirad.h
//  MLIproposal
//
//  Created by sinss on 12/9/3.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ulVirad : NSObject
{
    NSString *invsCode;
    NSNumber *poYearFrom;
    NSNumber *poYearTo;
    NSNumber *viradIndAdd;
}
@property (nonatomic, retain) NSString *invsCode;
@property (nonatomic, retain) NSNumber *poYearFrom;
@property (nonatomic, retain) NSNumber *poYearTo;
@property (nonatomic, retain) NSNumber *viradIndAdd;

@end
