//
//  lfFundResult.h
//  MLIproposal
//
//  Created by 張星星 on 12/6/21.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfFundResult : NSObject
{
    NSNumber *fundSeq;
    NSString *fundContent;
    NSNumber *fund1;
    NSNumber *fund2;
    NSNumber *fund3;
    NSString *type;
}

@property (nonatomic, retain) NSNumber *fundSeq;
@property (nonatomic, retain) NSString *fundContent;
@property (nonatomic, retain) NSNumber *fund1;
@property (nonatomic, retain) NSNumber *fund2;
@property (nonatomic, retain) NSNumber *fund3;
@property (nonatomic, retain) NSString *type;

@end
