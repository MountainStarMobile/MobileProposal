//
//  proposalManageViewController.h
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "planPickerViewController.h"
#import "PMInformationDelegate.h"
#import "PMDetailDelegate.h"
#import "PMProtectionContentDelegate.h"
#import "PMPayDetailDelegate.h"

@class saveProposalInfo;
@interface proposalManageViewController : UIViewController <PMAction>
{
    IBOutlet UITableView *aTableView;
    NSInteger modalType;
    saveProposalInfo *aSaveProposal;
}
@property (assign) NSInteger modalType;
@property (nonatomic, retain) saveProposalInfo *aProposal;

@end
