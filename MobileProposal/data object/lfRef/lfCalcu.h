//
//  lfCalcu.h
//  MLIproposal
//
//  Created by 張星星 on 12/7/20.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lfCalcu : NSObject
{
    NSString *planAbbrCode;
    NSNumber *CAREind;
    NSNumber *DDind;
    NSNumber *ADind;
    NSNumber *CRind;
    NSNumber *RETURNind;
    NSNumber *LF1;
    NSNumber *LFmix;
}
@property (nonatomic, retain) NSString *planAbbrCode;
@property (nonatomic, retain) NSNumber *CAREind;
@property (nonatomic, retain) NSNumber *DDind;
@property (nonatomic, retain) NSNumber *ADind;
@property (nonatomic, retain) NSNumber *CRind;
@property (nonatomic, retain) NSNumber *RETURNind;
@property (nonatomic, retain) NSNumber *LF1;
@property (nonatomic, retain) NSNumber *LFmix;

@end
