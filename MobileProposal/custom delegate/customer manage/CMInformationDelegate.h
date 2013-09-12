//
//  CMInformationDelegate.h
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "basicCustomerManageDelegate.h"
#import "customerInformationHeaderView.h"

@protocol CMInformationAction <NSObject>

- (void)didOpenFacebookUrl;
- (void)didOpenGooglePlusUrl;

@end

@interface CMInformationDelegate : basicCustomerManageDelegate <customerInformationAction>
{
    id <CMInformationAction> CMInformation;
}

@property (assign) id <CMInformationAction> CMInformation;

@end
