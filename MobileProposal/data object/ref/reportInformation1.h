//
//  reportInformation1.h
//  MLIproposal
//
//  Created by sinss on 12/9/10.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface reportInformation1 : NSObject
{
    NSString *type;
    NSString *detail;
    NSNumber *seq;
}
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *detail;
@property (nonatomic, retain) NSNumber *seq;

@end
