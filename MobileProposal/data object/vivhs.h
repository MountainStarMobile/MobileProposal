//
//  vivhs.h
//  MLIproposal
//
//  Created by sinss on 12/8/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface vivhs : NSObject
{
    NSString *invsCode;
    NSString *invsDate;
    NSString *currency;
    NSString *invsTitle;
    NSNumber *invsValue;
}
@property (nonatomic, retain) NSString *invsCode;
@property (nonatomic, retain) NSString *invsDate;
@property (nonatomic, retain) NSString *currency;
@property (nonatomic, retain) NSString *invsTitle;
@property (nonatomic, retain) NSNumber *invsValue;

@end
