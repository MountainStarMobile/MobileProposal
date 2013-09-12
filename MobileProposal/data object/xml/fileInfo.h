//
//  fileInfo.h
//  MLIproposal
//
//  Created by sinss on 12/10/23.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface fileInfo : NSObject
{
    NSString *fileDesc;
    NSString *fileName;
    NSNumber *fileVersion;
}
@property (nonatomic, retain) NSString *fileDesc;
@property (nonatomic, retain) NSString *fileName;
@property (nonatomic, retain) NSNumber *fileVersion;

@end
