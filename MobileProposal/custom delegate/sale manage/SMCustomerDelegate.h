//
//  SMCustomerDelegate.h
//  MobileProposal
//
//  Created by sinss on 13/3/6.
//  Copyright (c) 2013年 Among. All rights reserved.
//
/*
 與客戶的互動行程
 */

#import "basicSaleManagerDelegate.h"

@interface SMCustomerDelegate : basicSaleManagerDelegate

@property (nonatomic, retain) NSArray *customerArray;

- (id)initWithCustomerAction:(NSArray*)array;

@end
