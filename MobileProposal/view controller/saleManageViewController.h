//
//  saleManageViewController.h
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMCustomerDelegate.h"
#import "SMProposalDelegate.h"
#import "SMSaleDelegate.h"
#import "SMScheduleDelegate.h"

@interface saleManageViewController : UIViewController <SMAction>
{
    IBOutlet UITableView *aTableView;
}

@end
