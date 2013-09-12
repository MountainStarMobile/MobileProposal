//
//  agePrat.h
//  MobileProposal
//
//  Created by sinss on 13/2/19.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface agePrat : NSObject
{
    NSNumber *age;
    NSNumber *maleFactor;
    NSNumber *femaleFactor;
}

@property (nonatomic, retain) NSNumber *age;
@property (nonatomic, retain) NSNumber *maleFactor;
@property (nonatomic, retain) NSNumber *femaleFactor;

@end
