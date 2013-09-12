//
//  EncryptionFunction.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/24.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "EncryptionFunction.h"
#import "StringEncryption.h"
#import "NSData+Base64.h"

EncryptionFunction *encryptionInstance;

@implementation EncryptionFunction

+ (EncryptionFunction*)encryptgionInstance
{
    if (encryptionInstance == nil)
    {
        encryptionInstance = [[EncryptionFunction alloc] init];
    }
    return encryptionInstance;
}

#pragma mark 加密函式 
-(NSString *)getEnctString :(NSString *)_secret{
    
	NSString * _key = @"ihlih*0037JOHT*)";
	
	StringEncryption *crypto = [[[StringEncryption alloc] init] autorelease];
	NSData *_secretData = [_secret dataUsingEncoding:NSUTF8StringEncoding];
	CCOptions padding = kCCOptionPKCS7Padding;
	NSData *encryptedData = [crypto encrypt:_secretData key:[_key dataUsingEncoding:NSUTF8StringEncoding] padding:&padding];
	NSString *theenc = [encryptedData base64EncodingWithLineLength:0];
    return theenc;
}

@end
