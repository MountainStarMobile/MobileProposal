//
//  planIntro.h
//  MLIproposal
//
//  Created by 張星星 on 12/6/21.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface planIntroResult : NSObject
{
    NSString *introduction;
    NSNumber *seq;
}
@property (nonatomic, retain) NSString *introduction;
@property (nonatomic, retain) NSNumber *seq;

@end
