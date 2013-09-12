//
//  dmInfo.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/22.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#define dmXpath @"//DM//Item"
#define dmFileXpath @"//result//part1"
#define dm_seqKey @"seq"
#define dm_docNoKey @"doc_no"
#define dm_docAreaKey @"doc_area"
#define dm_commentKey @"comment"
#define dm_pmNoKey @"no"

@interface dmInfo : NSObject
{
    NSNumber *seq;
    NSString *docNo;
    NSString *docArea;
    NSString *comment;
    NSString *pmNo;
    NSString *dmDesc;
    NSString *dmDesc2;
}

@property (nonatomic, retain) NSNumber *seq;
@property (nonatomic, retain) NSString *docNo;
@property (nonatomic, retain) NSString *docArea;
@property (nonatomic, retain) NSString *comment;
@property (nonatomic, retain) NSString *pmNo;
@property (nonatomic, retain) NSString *dmDesc;
@property (nonatomic, retain) NSString *dmDesc2;

@end
