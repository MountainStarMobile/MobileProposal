//
//  customerManageViewController.h
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"
#import "CMInformationDelegate.h"
#import "CMContactLogDelegate.h"
#import "CMProposalLogDelegate.h"
#import "CMRelationLogDelegate.h"
#import "TSMiniWebBrowser.h"
#import "customerCreateTableViewController.h"

@class customerInfo;
@interface customerManageViewController : UIViewController <CMInformationAction, TSMiniWebBrowserDelegate, CMRelationAction>
{
    IBOutlet UITableView *aTableView;
    NSInteger modalType;
    customerInfo *aCustomer;
    BOOL isModify;
}

@property (assign) NSInteger modalType;
@property (assign) BOOL isModify;
@property (nonatomic, retain) customerInfo *aCustomer;

@end
