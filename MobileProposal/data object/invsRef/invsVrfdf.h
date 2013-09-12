//
//  invsVrfdf.h
//  MLIproposal
//
//  Created by sinss on 12/8/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface invsVrfdf : NSObject
{
    NSString *feldPtr;
    NSNumber *poYearFrom;
    NSNumber *poYearTo;
    NSNumber *valueRefundPerc;
}
@property (nonatomic, retain) NSString *feldPtr;
@property (nonatomic, retain) NSNumber *poYearFrom;
@property (nonatomic, retain) NSNumber *poYearTo;
@property (nonatomic, retain) NSNumber *valueRefundPerc;

@end
