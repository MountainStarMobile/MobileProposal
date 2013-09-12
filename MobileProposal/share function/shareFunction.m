//
//  shareFunction.m
//  MobileProposal
//
//  Created by 張星星 on 13/1/12.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "shareFunction.h"

shareFunction *shareFunctionInstance;

@implementation shareFunction

+ (shareFunction*)shareFunctionInstance
{
    if (shareFunctionInstance == nil)
    {
        shareFunctionInstance = [shareFunction new];
    }
    return shareFunctionInstance;
}

- (NSString*)formatCellPhoneWithCellPhoneNumber:(NSString*)phone
{
    //0933042565
    NSRange range1 = NSMakeRange(0, 4);
    NSRange range2 = NSMakeRange(4, 3);
    NSRange range3 = NSMakeRange(7, 3);
    NSMutableString *formatPhoneNumber = [NSMutableString stringWithCapacity:0];
    if ([phone length] < 10)
    {
        return phone;
    }
    NSString *part1 = [phone substringWithRange:range1];
    NSString *part2 = [phone substringWithRange:range2];
    NSString *part3 = [phone substringWithRange:range3];
    [formatPhoneNumber appendFormat:@"%@-%@-%@", part1, part2, part3];
    return formatPhoneNumber;
}

@end
