//
//  basicCustomerManageDelegate.h
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "customerInfo.h"

@protocol CMAction <NSObject>

- (void)CMActionDidSelectWithIndexPath:(NSIndexPath*)indexPath andTag:(NSUInteger)tag;

@end

@interface basicCustomerManageDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>
{
    NSUInteger CMTag;
    id <CMAction> delegate;
    customerInfo *aCustomer;
}

@property (assign) id<CMAction> delegate;
@property (assign) NSUInteger CMTag;
@property (nonatomic, retain) customerInfo *aCustomer;


@end
