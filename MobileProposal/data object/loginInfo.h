//
//  loginInfo.h
//  MobileProposal
//
//  Created by sinss on 13/3/4.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface loginInfo : NSObject
{
    NSString *account;
    NSString *password;
}

@property (nonatomic, retain) NSString *account;
@property (nonatomic, retain) NSString *password;

@end
