//
//  customerInfo.m
//  MLIproposal
//
//  Created by 張星星 on 12/4/21.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "customerInfo.h"
#import "Base64.h"

@implementation customerInfo

@synthesize relation, relationName;
@synthesize clientID, name, sex, birthDate, marriage, education, tel1, tel2, sec1, sec2, extend1, extend2;
@synthesize cellPhone, fax, email, zipCode, address, occuCode, occuLevel;
@synthesize ratingRateLf, age, dataFlagIn, seq, canSelect, bodyType;
@synthesize sameCustomer, agentCode, cloudId;
@synthesize facebook, googlePlus, nickName;
- (id)init
{
    self = [super init];
    if (self)
    {
        sameCustomer = YES;
        canSelect = YES;
        name = [[NSString alloc] initWithFormat:@""];
        sec1 = [[NSString alloc] initWithFormat:@""];
        tel1 = [[NSString alloc] initWithFormat:@""];
        extend1 = [[NSString alloc] initWithFormat:@""];
        sec2 = [[NSString alloc] initWithFormat:@""];
        tel2 = [[NSString alloc] initWithFormat:@""];
        extend2 = [[NSString alloc] initWithFormat:@""];
        nickName = [[NSString alloc] initWithFormat:@""];
        bodyType = [[NSString alloc] initWithFormat:@"0"];
        occuLevel = [[NSNumber alloc] initWithInteger:1];
        ratingRateLf = [[NSNumber alloc] initWithInteger:0];
    }
    return self;
}

- (void)dealloc
{
    [relation release], relation = nil;
    [relationName release], relationName = nil;
    [clientID release], clientID = nil;
    [name release], name = nil;
    [sex release], sex = nil;
    [birthDate release], birthDate = nil;
    [marriage release], marriage = nil;
    [education release], education = nil;
    [sec1 release], sec1 = nil;
    [tel1 release], tel1 = nil;
    [extend1 release], extend1 = nil;
    [sec2 release], sec2 = nil;
    [tel2 release], tel2 = nil;
    [extend2 release], extend2 = nil;
    [cellPhone release], cellPhone = nil;
    [fax release], fax = nil;
    [email release], email = nil;
    [zipCode release], zipCode = nil;
    [address release], address = nil;
    [occuCode release], occuCode = nil;
    [occuLevel release], occuLevel = nil;
    [ratingRateLf release], ratingRateLf = nil;
    [age release], age = nil;
    [dataFlagIn release], dataFlagIn = nil;
    [seq release], seq = nil;
    [bodyType release], bodyType = nil;
    [agentCode release], agentCode = nil;
    [cloudId release], cloudId = nil;
    [facebook release], facebook = nil;
    [googlePlus release], googlePlus = nil;
    [nickName release], nickName = nil;
    [super dealloc];
}

- (NSString*)GetCloudSQL
{
    NSString *fields = [NSString stringWithFormat:@"clob,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@",
                        clientID,
                        [Base64 encode:[name dataUsingEncoding:NSUTF8StringEncoding]],
                        sex,
                        birthDate,
                        marriage==nil?@"":marriage,
                        education==nil?@"":education,
                        tel1==nil?@"":tel1,
                        tel2==nil?@"":tel2,
                        cellPhone==nil?@"":cellPhone,
                        fax==nil?@"":fax,
                        email==nil?@"":email,
                        zipCode==nil?@"":zipCode,
                        address==nil?@"":address,
                        occuCode==nil?@"":occuCode,
                        occuLevel==nil?@"":occuLevel,
                        ratingRateLf==nil?@"":ratingRateLf,
                        age,
                        dataFlagIn==nil?@"":dataFlagIn,
                        agentCode];
    return fields;
}

+ (customerInfo*)GetCustomerRecordWithCloudString:(NSString*)cloudString andCloudId:(NSString*)cloudId
{
    NSArray *comp = [cloudString componentsSeparatedByString:@","];
    NSData *base64ForName = [Base64 decode:comp[2]];
    NSString *tmpName = [[[NSString alloc] initWithData:base64ForName encoding:NSUTF8StringEncoding] autorelease];

    customerInfo *customer = [[customerInfo alloc] init];
    customer.clientID = comp[1];
    customer.name = tmpName;
    customer.sex = comp[3];
    customer.birthDate = comp[4];
    customer.marriage = comp[5];
    customer.education = comp[6];
    customer.tel1 = comp[7];
    customer.tel2 = comp[8];
    customer.cellPhone = comp[9];
    customer.fax = comp[10];
    customer.email = comp[11];
    customer.zipCode = comp[12];
    customer.address = comp[13];
    customer.occuCode = comp[14];
    customer.occuLevel = comp[15];
    customer.ratingRateLf = comp[16];
    customer.age = comp[17];
    customer.dataFlagIn = comp[18];
    customer.agentCode = comp[19];
    customer.cloudId = cloudId;
    return [customer autorelease];
}

- (customerInfo*)GetNewCopyCustomer
{
    customerInfo *customer = [[customerInfo alloc] init];
    customer.clientID = clientID;
    customer.name = name;
    customer.sex = sex;
    customer.birthDate = birthDate;
    customer.marriage = marriage;
    customer.education = education;
    customer.tel1 = tel1;
    customer.tel2 = tel2;
    customer.cellPhone = cellPhone;
    customer.fax = fax;
    customer.email = email;
    customer.zipCode = zipCode;
    customer.address = address;
    customer.occuCode = occuCode;
    customer.occuLevel = occuLevel;
    customer.ratingRateLf = ratingRateLf;
    customer.age = age;
    customer.dataFlagIn = dataFlagIn;
    customer.agentCode = agentCode;
    
    return [customer autorelease];
}

@end
