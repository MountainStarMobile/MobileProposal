//
//  invsTarget.h
//  MLIproposal
//
//  Created by sinss on 12/8/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface invsTarget : NSObject
{
    NSString *invsCode;
    NSString *invsTitle;
    NSString *invsCompanyBno;
    NSString *currencyType;
    NSString *invsType;
    NSString *invsStsCode;
    NSString *invsStsDate;
    NSNumber *invsMiniAmt;
    NSNumber *showOrder;
    NSString *prjType;
    
    NSNumber *invsRate;
    NSNumber *invsValue;
    NSString *invsValueDate;
}
@property (nonatomic, retain) NSString *invsCode;
@property (nonatomic, retain) NSString *invsTitle;
@property (nonatomic, retain) NSString *invsCompanyBno;
@property (nonatomic, retain) NSString *currencyType;
@property (nonatomic, retain) NSString *invsType;
@property (nonatomic, retain) NSString *invsStsCode;
@property (nonatomic, retain) NSString *invsStsDate;
@property (nonatomic, retain) NSNumber *invsMiniAmt;
@property (nonatomic, retain) NSNumber *showOrder;
@property (nonatomic, retain) NSString *prjType;

@property (nonatomic, retain) NSNumber *invsRate;
@property (nonatomic, retain) NSNumber *invsValue;
@property (nonatomic, retain) NSString *invsValueDate;

@end
