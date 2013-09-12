//
//  CMRelationLogDelegate.h
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "basicCustomerManageDelegate.h"
#import "customerRelationCell.h"

@protocol CMRelationAction <NSObject>

- (void)didSelectRelationCellWithClientId:(NSString*)clientId;

@end

@interface CMRelationLogDelegate : basicCustomerManageDelegate <customerRelationAction>
{
    id<CMRelationAction> cmRelationDelegate;
}
@property (assign) id<CMRelationAction> cmRelationDelegate;

- (id)initWithRelationArray:(NSArray*)array;

@end
