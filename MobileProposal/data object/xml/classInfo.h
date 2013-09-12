//
//  classInfo.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/25.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#define classXpath @"//CLASS//group"
#define classGroupCommentkey @"comment"
#define class_seqKey @"seq"
#define class_docNoKey @"doc_no"
#define class_docAreaKey @"doc_area"
#define class_fileName @"no"

@interface classInfo : NSObject
{
    NSNumber *seq;
    NSString *docNo;
    NSString *docArea;
    NSString *file;
    NSString *docName;
    NSString *docName2;
}
@property (nonatomic, retain) NSNumber *seq;
@property (nonatomic, retain) NSString *docNo;
@property (nonatomic, retain) NSString *docArea;
@property (nonatomic, retain) NSString *file;
@property (nonatomic, retain) NSString *docName;
@property (nonatomic, retain) NSString *docName2;

@end
