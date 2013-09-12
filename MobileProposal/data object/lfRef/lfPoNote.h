//
//  lfPoNote.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfPoNote : NSObject
{
    NSString *planAbbrCode;
    NSNumber *seq;
    NSString *msgFile;
    NSNumber *premMini;
}
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSNumber *seq;
@property (nonatomic, retain) NSString *msgFile;
@property (nonatomic, retain) NSNumber *premMini;
@end
