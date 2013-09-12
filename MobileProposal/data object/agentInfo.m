//
//  agentInfo.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/5.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "agentInfo.h"

@implementation agentInfo

@synthesize agentCode, agentName, deptCode, telephone, address, writingClass;
@synthesize agentType, mail, invsIdent, fbIdent, loginDate, status;

- (id)init
{
    self = [super init];
    if (self)
    {
        agentCode = [[NSString alloc] initWithFormat:@"%@",@"F125650600"];
        agentName = [[NSString alloc] initWithFormat:@"%@",@"張星星"];
        deptCode = [[NSString alloc] initWithFormat:@"%@",@"90233"];
        telephone = [[NSString alloc] initWithFormat:@"%@",@"0933042565"];
        address = [[NSString alloc] initWithFormat:@"%@",@"新北市八里區龍米路一段100巷6號3樓"];
        mail = [[NSString alloc] initWithFormat:@"%@",@"sinss@mail.mli.com.tw"];
        writingClass = [[NSString alloc] initWithFormat:@"%@",@"3"];
        agentType = [[NSString alloc] initWithFormat:@"%@",@"內勤人員"];
        invsIdent = [[NSString alloc] initWithFormat:@"%@",@"Y"];
        fbIdent = [[NSString alloc] initWithFormat:@"%@",@"Y"];
        loginDate = [[NSString alloc] initWithFormat:@"%@",@"2012/05/01"];
    }
    return self;
}
- (void)dealloc
{
    [agentCode release], agentCode = nil;
    [agentName release], agentName = nil;
    [deptCode release], deptCode = nil;
    [telephone release], telephone = nil;
    [address release], address = nil;
    [mail release], mail = nil;
    [writingClass release], writingClass = nil;
    [agentType release], agentType = nil;
    [invsIdent release], invsIdent = nil;
    [fbIdent release], fbIdent = nil;
    [loginDate release], loginDate = nil;
    [status release], status = nil;
    [super dealloc];
}

- (NSDictionary*)agentInfoToDictionary
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          agentCode, ag_agentCodeKey,
                          agentName, ag_agentNameKey,
                          deptCode, ag_deptCodeKey,
                          telephone, ag_telephoneKey,
                          address, ag_addressKey,
                          mail, ag_mailKey,
                          writingClass, ag_writingClassKey,
                          agentType, ag_agentTypeKey,
                          invsIdent, ag_invsIdentKey,
                          fbIdent, ag_fbIdentKey,
                          loginDate, ag_loginDateKey,
                          status, ag_loginStatusKey,
                          nil];
    
    return dict;
}
- (agentInfo*)dictionaryToAgentInfo:(NSDictionary*)dict;
{
    self.agentCode = [dict valueForKey:ag_agentCodeKey];
    self.agentName = [dict valueForKey:ag_agentNameKey];
    self.deptCode = [dict valueForKey:ag_deptCodeKey];
    self.telephone = [dict valueForKey:ag_telephoneKey];
    self.address = [dict valueForKey:ag_addressKey];
    self.mail = [dict valueForKey:ag_mailKey];
    self.writingClass = [dict valueForKey:ag_writingClassKey];
    self.agentType = [dict valueForKey:ag_agentTypeKey];
    self.invsIdent = [dict valueForKey:ag_invsIdentKey];
    self.fbIdent = [dict valueForKey:ag_fbIdentKey];
    self.loginDate = [dict valueForKey:ag_loginDateKey];
    self.status = [dict valueForKey:ag_loginStatusKey];
    
    return self;
}

@end
