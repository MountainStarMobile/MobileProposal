//
//  errorResult.h
//  MLIproposal
//
//  Created by 張星星 on 12/6/21.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface errorResult : NSObject
{
    NSNumber *seq;
    NSString *planAbbr;
    NSString *errorMessage;
}
@property (nonatomic, retain) NSNumber *seq;
@property (nonatomic, retain) NSString *planAbbr;
@property (nonatomic, retain) NSString *errorMessage;

@end
