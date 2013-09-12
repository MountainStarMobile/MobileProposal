//
//  vexrt.h
//  MLIproposal
//
//  Created by sinss on 12/8/21.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface vexrt : NSObject
{
    NSString *exrtDate;
    NSString *currency;
    NSNumber *buyingRate;
    NSString *exrtSourceInd;
}
@property (nonatomic, retain) NSString *exrtDate;
@property (nonatomic, retain) NSString *currency;
@property (nonatomic, retain) NSNumber *buyingRate;
@property (nonatomic, retain) NSString *exrtSourceInd;

@end
