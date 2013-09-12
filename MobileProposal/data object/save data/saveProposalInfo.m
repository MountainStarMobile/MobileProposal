//
//  saveProposalInfo.m
//  MLIproposal
//
//  Created by 張星星 on 12/5/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "saveProposalInfo.h"
#import "customerInfo.h"
#import "Base64.h"

@implementation saveProposalInfo

@synthesize fileName, agentCode, i1Relation, o1Relation, saveInd;
@synthesize customerInd, proposalType, policyNo, processDate, modx, cloudId, searchKey;
@synthesize o1Customer, i1Customer;

- (id)init
{
    self = [super init];
    if (self)
    {
        fileName = [[NSString alloc] initWithFormat:@""];
        customerInd = [[NSString alloc] initWithFormat:@""];
        saveInd = [[NSString alloc] initWithFormat:@""];
        proposalType = [[NSString alloc] initWithFormat:@""];
        customerInd = [[NSString alloc] initWithFormat:@""];
    }
    return self;
}

- (void)dealloc
{
    [fileName release], fileName = nil;
    [agentCode release], agentCode = nil;
    [i1Relation release], i1Relation = nil;
    [o1Relation release], o1Relation = nil;
    [saveInd release], saveInd = nil;
    [customerInd release], customerInd = nil;
    [proposalType release], proposalType = nil;
    [policyNo release], policyNo = nil;
    [processDate release], processDate = nil;
    [modx release], modx = nil;
    [cloudId release], cloudId = nil;
    [i1Customer release], i1Customer = nil;
    [o1Customer release], o1Customer = nil;
    [searchKey release], searchKey = nil;
    [super dealloc];
}
#pragma mark -
- (NSString*)GetCloudSQL
{
    NSString *fields = [NSString stringWithFormat:@"cloe,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@",
                        [Base64 encode:[fileName dataUsingEncoding:NSUTF8StringEncoding]],
                        agentCode,
                        i1Relation,
                        o1Relation,
                        saveInd,
                        customerInd,
                        proposalType,
                        policyNo,
                        processDate,
                        modx,
                        @"cloud_id"];
    return fields;
}

+ (saveProposalInfo*)GetProposalWithCloudString:(NSString*)cloudString
{
    saveProposalInfo *info = [[saveProposalInfo alloc] init];
    NSArray *comp = [cloudString componentsSeparatedByString:@","];
    NSData *base64ForfileName = [Base64 decode:comp[1]];
    NSString *fileName = [[[NSString alloc] initWithData:base64ForfileName encoding:NSUTF8StringEncoding] autorelease];
    info.fileName = fileName;
    info.agentCode = comp[2];
    info.i1Relation = comp[3];
    info.o1Relation = comp[4];
    info.saveInd = comp[5];
    info.proposalType = comp[7];
    info.policyNo = comp[8];
    info.processDate = comp[9];
    info.modx = comp[10];
    info.cloudId = comp[11];
    return [info autorelease];
}


@end
