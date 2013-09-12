//
//  lfPoNoteDesc.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfPoNoteDesc : NSObject
{
    NSString *msgFile;
    NSString *deatil;
    NSNumber *seq;
}
@property (nonatomic, retain) NSString *msgFile;
@property (nonatomic, retain) NSString *deatil;
@property (nonatomic, retain) NSNumber *seq;
@end
