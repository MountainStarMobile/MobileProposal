//
//  loginProcess.m
//  MobileProposal
//
//  Created by sinss on 13/3/4.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "loginProcess.h"
#import "webserviceRequestLoader.h"
#import "PathAndDirectoryFunction.h"

@interface loginProcess()

@property (nonatomic, retain) NSString *accountId;
@property (nonatomic, retain) NSString *password;

- (BOOL)initData;
- (BOOL)createDocumentData;
- (BOOL)createPersonalData;

@end

@implementation loginProcess
@synthesize delegate;

- (id)initWithAccount:(NSString *)acc andPassword:(NSString *)pass
{
    self = [super init];
    if (self)
    {
        self.accountId = acc;
        self.password = pass;
    }
    return self;
}

- (void)dealloc
{
    [_accountId release], _accountId = nil;
    [_password release], _password = nil;
    [super dealloc];
}

#pragma mark - 開始登入

- (void)startLoginProcess
{
    [[NSUserDefaults standardUserDefaults] setValue:self.accountId forKey:key_agentCode];
    [[NSUserDefaults standardUserDefaults] setValue:self.password forKey:key_password];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self initData];
    [self createDocumentData];
    [self createPersonalData];
}

#pragma mark - 建立資料 & 個人資料夾

- (BOOL)initData
{
    [delegate loginWithStatus:1];
    
    return YES;
}

- (BOOL)createDocumentData
{
    [delegate loginWithStatus:2];
    
    return YES;
}

- (BOOL)createPersonalData
{
    NSString *personalDir = [PathAndDirectoryFunction getDocumentDirectoryWithAgentCode:self.accountId];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSString *bundleFile;
    NSString *targetPath;
    if (![fileManager fileExistsAtPath:personalDir isDirectory:YES])
    {
        //表示不存在，建立一個資料夾
        if (![fileManager createDirectoryAtPath:personalDir withIntermediateDirectories:YES attributes:nil error:&error])
        {
            NSLog(@"create personal folder %@", error);
            return NO;
        }
        //複製sqlite至個人資料夾
        bundleFile = [[NSBundle mainBundle] pathForResource:db_saveProposal ofType:db_extension];
        targetPath = [PathAndDirectoryFunction getPersonalPathInDocumentWithAgentCode:self.accountId andFileName:db_saveProposal andExtension:db_extension];
        if (![fileManager fileExistsAtPath:targetPath isDirectory:NO])
        {
            if (![fileManager copyItemAtPath:bundleFile toPath:targetPath error:&error])
            {
                NSLog(@"saveProposal.sqlite %@",error);
            }
            
        }
    }
    [delegate loginWithStatus:3];
    return YES;
}
@end
