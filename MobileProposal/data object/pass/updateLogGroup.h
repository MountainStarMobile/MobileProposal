//
//  updateLogGroup.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/29.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface updateLogGroup : NSObject
{
    NSString *version;
    NSArray *updateLogArray;
}

@property (nonatomic, retain) NSString *version;
@property (nonatomic, retain) NSArray *updateLogArray;


@end
