//
//  lfUwVS.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/9.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfUwVS : NSObject
{
    NSNumber *seq;
    NSString *groupA;
    NSString *aType;
    NSNumber *Afrom;
    NSNumber *Ato;
    NSString *groupB;
    NSNumber *Bvalue;
    NSString *uwMsg;
    NSString *prjSeq;
}
@property (nonatomic, retain) NSNumber *seq;
@property (nonatomic, retain) NSString *groupA;
@property (nonatomic, retain) NSString *aType;
@property (nonatomic, retain) NSNumber *Afrom;
@property (nonatomic, retain) NSNumber *Ato;
@property (nonatomic, retain) NSString *groupB;
@property (nonatomic, retain) NSNumber *Bvalue;
@property (nonatomic, retain) NSString *uwMsg;
@property (nonatomic, retain) NSString *prjSeq;

@end
