//
//  loginProcess.h
//  MobileProposal
//
//  Created by sinss on 13/3/4.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <Foundation/Foundation.h>

@class agentInfo;
@protocol loginStatusDelegate <NSObject>

- (void)loginWithStatus:(NSInteger)status;
- (void)loginFinishWithStatus:(NSInteger)status andAgentInfo:(agentInfo*)agent;
- (void)loginFaildWithStatus:(NSInteger)status;

@end

@interface loginProcess : NSObject
{
    id <loginStatusDelegate> delegate;
    
}

@property (assign) id <loginStatusDelegate> delegate;

- (id)initWithAccount:(NSString*)acct andPassword:(NSString*)pass;

- (void)startLoginProcess;

@end
