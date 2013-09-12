//
//  customerContaceInfo.h
//  MobileProposal
//
//  Created by sinss on 13/1/15.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface customerContaceInfo : NSObject
{
    NSString *date;
    NSString *content;
    NSString *status;
    NSString *statusMessage;
}
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *statusMessage;

@end
