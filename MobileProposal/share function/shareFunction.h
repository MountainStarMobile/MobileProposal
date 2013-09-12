//
//  shareFunction.h
//  MobileProposal
//
//  Created by 張星星 on 13/1/12.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shareFunction : NSObject

- (NSString*)formatCellPhoneWithCellPhoneNumber:(NSString*)phone;

+ (shareFunction*)shareFunctionInstance;

@end
