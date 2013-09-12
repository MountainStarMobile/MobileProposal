//
//  EncryptionFunction.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/24.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncryptionFunction : NSObject

+ (EncryptionFunction*)encryptgionInstance;
//加密Function 
- (NSString *)getEnctString :(NSString *)_secret;

@end
