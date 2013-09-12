//
//  printItem.h
//  MLIproposal
//
//  Created by sinss on 12/9/12.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface printItem : NSObject
{
    NSString *printItemCode;
    NSString *printItemDesc;
    NSString *proposalType;
    NSString *printRule;
    NSString *defaultValue;
    NSNumber *seq;
    BOOL isSelected;
}
@property (nonatomic, retain) NSString *printItemCode;
@property (nonatomic, retain) NSString *printItemDesc;
@property (nonatomic, retain) NSString *proposalType;
@property (nonatomic, retain) NSString *printRule;
@property (nonatomic, retain) NSString *defaultValue;
@property (nonatomic, retain) NSNumber *seq;
@property (assign) BOOL isSelected;

@end
