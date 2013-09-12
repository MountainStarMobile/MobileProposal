//
//  otherItem.h
//  MLIproposal
//
//  Created by sinss on 12/10/29.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface otherItem : NSObject
{
    NSString *displayName;
    NSString *fileName;
    NSString *fileExt;
    NSString *groupName;
    NSString *seq;
}
@property (nonatomic, retain) NSString *displayName;
@property (nonatomic, retain) NSString *fileName;
@property (nonatomic, retain) NSString *fileExt;
@property (nonatomic, retain) NSString *groupName;
@property (nonatomic, retain) NSString *seq;

@end
