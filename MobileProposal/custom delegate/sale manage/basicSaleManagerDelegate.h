//
//  basicSaleManagerDelegate.h
//  MobileProposal
//
//  Created by sinss on 13/3/6.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SMAction <NSObject>

- (void)SMActionDidSelectWithIndexPath:(NSIndexPath*)indexPath andTag:(NSUInteger)tag;

@end

@interface basicSaleManagerDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>
{
    NSInteger SMTag;
    id <SMAction> delegate;
}

- (void)createFakeData;

@property (assign) id <SMAction> delegate;
@property (assign) NSInteger SMTag;

@end
