//
//  DatabaseFunction.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "DatabaseFunction.h"
#import "PathAndDirectoryFunction.h"

FMDatabase *_passDB;
FMDatabase *_saveProposalDB;
FMDatabase *_refDB;
FMDatabase *_dataDB;
FMDatabase *_insuranceDB;
FMDatabase *_factorDB;
FMDatabase *_lfRefDB;
FMDatabase *_arprDB;
FMDatabase *_aretDB;
FMDatabase *_cpDB;
FMDatabase *_cvDB;
FMDatabase *_pvDB;
FMDatabase *_saDB;
FMDatabase *_rpuDB;
FMDatabase *_invsRefDB;
FMDatabase *_hvaRefDB;
FMDatabase *_vaRefDB;
FMDatabase *_anRefDB;
FMDatabase *_vivhsDB;

@implementation DatabaseFunction

+ (FMDatabase*)GetPassDB
{
    NSString *dbPath = [PathAndDirectoryFunction getDocumentPathWithFileName:db_pass andExtension:db_extension];
    if (_passDB == nil)
    {
        _passDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_passDB open])
        {
            NSLog(@"open pass.sqlite succeed");
        }
    }
    else 
    {
        if (![_passDB goodConnection])
        {
            if ([_passDB open])
            {
                NSLog(@"open pass.sqlite again");
            }
        }
    }
    return _passDB;
}

+ (FMDatabase*)GetSaveProposalDB
{
    NSString *agentCode = [[NSUserDefaults standardUserDefaults] valueForKey:key_agentCode];
    NSString *dbPath = [PathAndDirectoryFunction getPersonalPathInDocumentWithAgentCode:agentCode andFileName:db_saveProposal andExtension:db_extension];
    if (_saveProposalDB == nil || ![[_saveProposalDB databasePath] isEqualToString:dbPath])
    {
        _saveProposalDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_saveProposalDB open])
        {
            NSLog(@"open saveProposal.sqlite succeed");
        }
    }
    else 
    {
        if (![_saveProposalDB goodConnection])
        {
            if ([_saveProposalDB open])
            {
                NSLog(@"open saveProposal.sqlite again");
            }
        }
    }
    return _saveProposalDB;
}

+ (FMDatabase*)GetRefDB
{
    //NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_ref andExtension:db_extension];
    NSString *dbPath = [[NSBundle mainBundle] pathForResource:db_ref ofType:db_extension];
    if (_refDB == nil)
    {
        _refDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_refDB open])
        {
            NSLog(@"open ref.sqlite succeed");
        }
    }
    else 
    {
        if (![_refDB goodConnection])
        {
            if ([_refDB open])
            {
                NSLog(@"open ref.sqlite again");
            }
        }
    }
    return _refDB;
}

+ (FMDatabase*)GetdataDB
{
    //NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_data andExtension:db_extension];
    NSString *dbPath = [[NSBundle mainBundle] pathForResource:db_data ofType:db_extension];
    if (_dataDB == nil)
    {
        _dataDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_dataDB open])
        {
            NSLog(@"open data.sqlite succeed");
        }
    }
    else
    {
        if (![_dataDB goodConnection])
        {
            if ([_dataDB open])
            {
                NSLog(@"open data.sqlite again");
            }
        }
    }
    return _dataDB;
}

+ (FMDatabase*)GetInsuranceRefDB
{
    NSString *dbPath = [[NSBundle mainBundle] pathForResource:db_insuranceRef ofType:db_extension];
    if (_insuranceDB == nil)
    {
        _insuranceDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_insuranceDB open])
        {
            NSLog(@"open insuranceRef.sqlite succeed");
        }
    }
    else
    {
        if (![_insuranceDB goodConnection])
        {
            if ([_insuranceDB open])
            {
                NSLog(@"open data.sqlite again");
            }
        }
    }
    return _insuranceDB;
}


+ (FMDatabase*)GetLfRefDB
{
    NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_lfRef andExtension:db_extension];
    if (_lfRefDB == nil)
    {
        if (![[NSFileManager defaultManager] fileExistsAtPath:dbPath])
            NSLog(@"lfRef not exist!");
        _lfRefDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_lfRefDB open])
        {
            NSLog(@"open lfRef.sqlite succeed");
        }
    }
    else 
    {
        if (![_lfRefDB goodConnection])
        {
            if ([_lfRefDB open])
            {
                NSLog(@"open lfref.sqlite again");
            }
        }
    }
    return _lfRefDB;
}

+ (FMDatabase*)GetFactorDB
{
    NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_factor andExtension:db_extension];
    if (_factorDB == nil)
    {
        _factorDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_factorDB open])
        {
            NSLog(@"open factor.sqlite succeed");
        }
    }
    else 
    {
        if (![_factorDB goodConnection])
        {
            if ([_factorDB open])
            {
                NSLog(@"open factor.sqlite again");
            }
        }
    }
    return _factorDB;
}

+ (FMDatabase*)GetArprDB
{
    NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_arpr andExtension:db_extension];
    if (_arprDB == nil)
    {
        _arprDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_arprDB open])
        {
            NSLog(@"open arpr.sqlite succeed");
        }
    }
    else 
    {
        if (![_arprDB goodConnection])
        {
            if ([_arprDB open])
            {
                NSLog(@"open arpr.sqlite again");
            }
        }
    }
    return _arprDB;
}

+ (FMDatabase*)GetAretDB
{
    NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_lfAret andExtension:db_extension];
    if (_aretDB == nil)
    {
        _aretDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_aretDB open])
        {
            NSLog(@"open lfAret.sqlite succeed");
        }
    }
    else
    {
        if (![_aretDB goodConnection])
        {
            if ([_aretDB open])
            {
                NSLog(@"open lfAret.sqlite again");
            }
        }
    }
    return _aretDB;
}

+ (FMDatabase*)GetCpDB
{
    NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_cp andExtension:db_extension];
    if (_cpDB == nil)
    {
        _cpDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_cpDB open])
        {
            NSLog(@"open cp.sqlite succeed");
        }
    }
    else 
    {
        if (![_cpDB goodConnection])
        {
            if ([_cpDB open])
            {
                NSLog(@"open cp.sqlite again");
            }
        }
    }
    return _cpDB;
}

+ (FMDatabase*)GetCvDB
{
    NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_cv andExtension:db_extension];
    if (_cvDB == nil)
    {
        _cvDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_cvDB open])
        {
            NSLog(@"open cv.sqlite succeed");
        }
    }
    else 
    {
        if (![_cvDB goodConnection])
        {
            if ([_cvDB open])
            {
                NSLog(@"open cv.sqlite again");
            }
        }
    }
    return _cvDB;
}

+ (FMDatabase*)GetPvDB
{
    NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_pv andExtension:db_extension];
    if (_pvDB == nil)
    {
        _pvDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_pvDB open])
        {
            NSLog(@"open pv.sqlite succeed");
        }
    }
    else 
    {
        if (![_pvDB goodConnection])
        {
            if ([_pvDB open])
            {
                NSLog(@"open pv.sqlite again");
            }
        }
    }
    return _pvDB;
}

+ (FMDatabase*)GetSaDB
{
    NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_sa andExtension:db_extension];
    if (_saDB == nil)
    {
        _saDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_saDB open])
        {
            NSLog(@"open sa.sqlite succeed");
        }
    }
    else 
    {
        if (![_saDB goodConnection])
        {
            if ([_saDB open])
            {
                NSLog(@"open sa.sqlite again");
            }
        }
    }
    return _saDB;
}

+ (FMDatabase*)GetRpuDB
{
    NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_rpu andExtension:db_extension];
    if (_rpuDB == nil)
    {
        _rpuDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_rpuDB open])
        {
            NSLog(@"open rpu.sqlite succeed");
        }
    }
    else 
    {
        if (![_rpuDB goodConnection])
        {
            if ([_rpuDB open])
            {
                NSLog(@"open rpu.sqlite again");
            }
        }
    }
    return _rpuDB;
}

+ (FMDatabase*)GetInvsRefDB
{
    NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_invsRef andExtension:db_extension];
    if (_invsRefDB == nil)
    {
        _invsRefDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_invsRefDB open])
        {
            NSLog(@"open invsRef.sqlite succeed");
        }
    }
    else 
    {
        if (![_invsRefDB goodConnection])
        {
            if ([_invsRefDB open])
            {
                NSLog(@"open invsRef.sqlite again");
            }
        }
    }
    return _invsRefDB;
}

+ (FMDatabase*)GetHvaRefDB
{
    NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_hvaRef andExtension:db_extension];
    if (_hvaRefDB == nil)
    {
        _hvaRefDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_hvaRefDB open])
        {
            NSLog(@"open hvaRef.sqlite succeed");
        }
    }
    else 
    {
        if (![_hvaRefDB goodConnection])
        {
            if ([_hvaRefDB open])
            {
                NSLog(@"open hvaRef.sqlite again");
            }
        }
    }
    return _hvaRefDB;
}

+ (FMDatabase*)GetVaDB
{
    NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_vaRef andExtension:db_extension];
    if (_vaRefDB == nil)
    {
        _vaRefDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_vaRefDB open])
        {
            NSLog(@"open vaRef.sqlite succeed");
        }
    }
    else 
    {
        if (![_vaRefDB goodConnection])
        {
            if ([_vaRefDB open])
            {
                NSLog(@"open vaRef.sqlite again");
            }
        }
    }
    return _vaRefDB;
}

+ (FMDatabase*)GetAnRefDB
{
    NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_anRef andExtension:db_extension];
    if (_anRefDB == nil)
    {
        _anRefDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_anRefDB open])
        {
            NSLog(@"open anRef.sqlite succeed");
        }
    }
    else 
    {
        if (![_anRefDB goodConnection])
        {
            if ([_anRefDB open])
            {
                NSLog(@"open anRef.sqlite again");
            }
        }
    }
    return _anRefDB;
}

+ (FMDatabase*)GetVivhsDB
{
    NSString *dbPath = [PathAndDirectoryFunction getCachePathWithFileName:db_vivhs andExtension:db_extension];
    if (_vivhsDB == nil)
    {
        _vivhsDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_vivhsDB open])
        {
            NSLog(@"open vivhs.sqlite succeed");
        }
    }
    else
    {
        if (![_vivhsDB goodConnection])
        {
            if ([_vivhsDB open])
            {
                NSLog(@"open vivhs.sqlite again");
            }
        }
    }
    return _vivhsDB;
}
#pragma mark 判斷為何種類型的建議書
+ (FMDatabase*)GetRefDBwithProposalType:(NSString*)proposalType
{
    if ([proposalType isEqualToString:proposalType_lf])
    {
        return [self GetLfRefDB];
    }
    else if ([proposalType isEqualToString:proposalType_invs])
    {
        return [self GetInvsRefDB];
    }
    else if ([proposalType isEqualToString:proposalType_ul])
    {
        return [self GetInvsRefDB];
    }
    else if ([proposalType isEqualToString:proposalType_hva])
    {
        return [self GetVaDB];
    }
    else if ([proposalType isEqualToString:proposalType_an])
    {
        return [self GetAnRefDB];
    }
    return [self GetLfRefDB];
}
@end
