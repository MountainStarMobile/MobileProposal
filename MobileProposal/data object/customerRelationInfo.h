//
//  customerRelationInfo.h
//  MobileProposal
//
//  Created by sinss on 13/1/15.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface customerRelationInfo : NSObject
{
    NSString *clientId;
    NSString *clientName;
    NSString *relationCode;
    NSString *relationId;
    NSString *relationName;
}
@property (nonatomic, retain) NSString *clientId;
@property (nonatomic, retain) NSString *clientName;
@property (nonatomic, retain) NSString *relationCode;
@property (nonatomic, retain) NSString *relationId;
@property (nonatomic, retain) NSString *relationName;

@end
