//
//  GlobalFunctions.m
//  ClockReminder
//
//  Created by 張星星 on 11/12/16.
//  Copyright (c) 2011年 星星. All rights reserved.
//

#import "GlobalFunctions.h"
#import "SwitchFunction.h"
#import "errorResult.h"

GlobalFunctions *globalInstance;
@implementation GlobalFunctions

+ (GlobalFunctions*)globalInstance
{
    if (globalInstance == nil)
    {
        globalInstance = [[GlobalFunctions alloc] init];
    }
    return globalInstance;
}

- (NSInteger)currentLanguageInd
{
    //zh-Hant  繁體中文
    //zh-Hans  簡體中文
    NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];
    if ([language isEqualToString:@"zh-Hant"])
    {
        return 0;
    }
    else
    {
        return 1;
    }
    NSLog(@"%@",language);
}

- (NSString *)GetUUID
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return [(NSString *)string autorelease];
}

- (NSString*)displayAgentCode:(NSString*)agentCode
{
    NSRange range;
    range.length = 7;
    range.location = 0;
    NSString *newAgentCode;
    if ([agentCode length] == 10)
    {
        newAgentCode = [NSString stringWithFormat:@"%@XXX",[agentCode substringWithRange:range]];
    }
    else 
    {
        newAgentCode = [NSString stringWithFormat:@"%@",agentCode];
    }
    
    return newAgentCode;
}
- (NSString*)displayErrorMessage:(NSArray*)error
{
    NSMutableString *message = [NSMutableString stringWithCapacity:0];
    for (errorResult *tmp in error)
    {
        if ([tmp.planAbbr isEqualToString:@""])
        {
            [message appendFormat:@"．%@\n", tmp.errorMessage];
        }
        else
        {
            [message appendFormat:@"．%@-%@\n",tmp.planAbbr, tmp.errorMessage];
        }
        
    }
    return message;
}

- (NSString*)GetCurrentCustomerSerialIDWithSex:(NSString*)sex
{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"proposal" ofType:@"plist"]];
    NSArray *firstArray = [dict valueForKey:@"serialKey"];
    NSInteger serial = [[[NSUserDefaults standardUserDefaults] valueForKey:customerSerialKey] integerValue];
    NSInteger serialfirst = [[[NSUserDefaults standardUserDefaults] valueForKey:customerSerialFirstKey] integerValue];
    NSString *first = [firstArray objectAtIndex:serialfirst];
    NSString *customerID = nil;
    if (serial >= 99999999)
    {
        serial = 0;
        serialfirst ++;
        first = [firstArray objectAtIndex:serialfirst];
    }
    if ([sex isEqualToString:@"1"])
    {
        customerID = [NSString stringWithFormat:@"%@1%08i", first, serial + 1];
    }
    else if ([sex isEqualToString:@"2"])
    {
        customerID = [NSString stringWithFormat:@"%@2%08i", first, serial + 1];
    }
    NSLog(@"create id : %@", customerID);
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%i",serial + 1] forKey: customerSerialKey];
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%i",serialfirst] forKey: customerSerialFirstKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return customerID;
}
#pragma mark 取得policy_no的流水號
- (NSString*)GetCurrentPolicySerial
{
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"proposal" ofType:@"plist"]];
    NSArray *firstArray = [dict valueForKey:@"serialKey"];
    NSInteger serial = [[[NSUserDefaults standardUserDefaults] valueForKey:policySerialKey] integerValue];
    NSInteger serialfirst = [[[NSUserDefaults standardUserDefaults] valueForKey:policySerialFirstKey] integerValue];
    NSString *first = [firstArray objectAtIndex:serialfirst];
    NSString *policyNo = nil;
    if (serial >= 99999999999)
    {
        serial = 0;
        serialfirst ++;
        first = [firstArray objectAtIndex:serialfirst];
    }
    policyNo = [NSString stringWithFormat:@"%@%011i", first, serial + 1];
    NSLog(@"policy_no : %@", policyNo);
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%i",serial + 1] forKey: policySerialKey];
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%i",serialfirst] forKey: policySerialFirstKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return policyNo;
}

#pragma mark 取得一個亂數產生的字串
- (NSString*)GetRandomStringWithLength:(NSInteger)len
{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++)
    {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    
    return randomString;
}
@end
