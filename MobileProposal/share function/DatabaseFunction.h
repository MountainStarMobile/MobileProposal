//
//  DatabaseFunction.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DatabaseFunction : NSObject
{
   
}

+ (FMDatabase*)GetPassDB;
+ (FMDatabase*)GetSaveProposalDB;
+ (FMDatabase*)GetRefDB;
+ (FMDatabase*)GetdataDB;
+ (FMDatabase*)GetInsuranceRefDB;
+ (FMDatabase*)GetLfRefDB;
+ (FMDatabase*)GetFactorDB;
+ (FMDatabase*)GetArprDB;
+ (FMDatabase*)GetAretDB;
+ (FMDatabase*)GetCpDB;
+ (FMDatabase*)GetCvDB;
+ (FMDatabase*)GetPvDB;
+ (FMDatabase*)GetSaDB;
+ (FMDatabase*)GetRpuDB;
+ (FMDatabase*)GetInvsRefDB;
+ (FMDatabase*)GetHvaRefDB;
+ (FMDatabase*)GetVaDB;
+ (FMDatabase*)GetAnRefDB;
+ (FMDatabase*)GetVivhsDB;
+ (FMDatabase*)GetRefDBwithProposalType:(NSString*)proposalType;

@end
