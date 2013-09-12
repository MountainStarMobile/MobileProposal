//
//  classGroup.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/25.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface classGroup : NSObject
{
    NSString *groupName;
    NSArray *classArray;
}
@property (nonatomic, retain) NSString *groupName;
@property (nonatomic, retain) NSArray *classArray;

@end
