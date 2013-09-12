//
//  updateLogInfo.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/29.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface updateLogInfo : NSObject
{
    NSString *date;
    NSString *log;
    NSString *version;
    NSNumber *seq;
}
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *log;
@property (nonatomic, retain) NSString *version;
@property (nonatomic, retain) NSNumber *seq;

@end
