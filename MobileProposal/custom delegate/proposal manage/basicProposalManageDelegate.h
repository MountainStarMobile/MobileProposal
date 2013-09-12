//
//  basicProposalManageDelegate.h
//  MobileProposal
//
//  Created by sinss on 13/1/16.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PMAction <NSObject>

- (void)PMActionDidSelectWithIndexPath:(NSIndexPath*)indexPath andTag:(NSUInteger)tag;

@end

@interface basicProposalManageDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>
{
    NSUInteger PMTag;
    id <PMAction> delegate;
    NSArray *planArray;
    NSArray *pldfArray;
    NSArray *customerArray;
}

@property (assign) id<PMAction> delegate;
@property (assign) NSUInteger PMTag;
@property (nonatomic, retain) NSArray *planArray;
@property (nonatomic, retain) NSArray *pldfArray;
@property (nonatomic, retain) NSArray *customerArray;

@end
