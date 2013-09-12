//
//  occuInfo.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/29.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface occuInfo : NSObject
{
    NSString *occuCode;
    NSString *occuClass;
    NSString *occuDesc;
    NSString *occuLevel;
    NSNumber *fee;
}
@property (nonatomic, retain) NSString *occuCode;
@property (nonatomic, retain) NSString *occuClass;
@property (nonatomic, retain) NSString *occuDesc;
@property (nonatomic, retain) NSString *occuLevel;
@property (nonatomic, retain) NSNumber *fee;

@end
