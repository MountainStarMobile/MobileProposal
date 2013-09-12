//
//  customerCreateTableViewController.h
//  MobileProposal
//
//  Created by sinss on 13/1/29.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "tempTableViewController.h"
#import "REComposeViewController.h"
#import "telephoneViewController.h"
#import "birthdayPickerViewController.h"
#import "occuLevelPickerViewController.h"

@class customerInfo;

@protocol customerCreateAction <NSObject>

- (void)didFinishCustomerModifyWithCustomerInfo:(customerInfo*)customer;

@end

@interface customerCreateTableViewController : tempTableViewController
<UITextFieldDelegate, REComposeViewControllerDelegate, inputTelephoneAction, birthdayPickerAction,
selectOccuLevelAction>
{
    id <customerCreateAction> delegate;
    customerInfo *aCustomer;
}


@property (assign) id <customerCreateAction> delegate;
@property (nonatomic, retain) customerInfo *aCustomer;


@end
