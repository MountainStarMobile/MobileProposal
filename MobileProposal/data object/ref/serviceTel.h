//
//  serviceTel.h
//  MobileProposal
//
//  Created by sinss on 13/1/16.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface serviceTel : NSObject
{
    NSString *companyName;
    NSString *telphone;
    NSString *type;
    NSNumber *seq;
}
@property (nonatomic, retain) NSString *companyName;
@property (nonatomic, retain) NSString *telphone;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSNumber *seq;

@end
