//
//  planPickerViewController.h
//  MobileProposal
//
//  Created by sinss on 13/1/21.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "NIDropDown.h"
#import "tempViewController.h"
#import "selectPlanCategoryViewController.h"
#import "selectPlanTypeViewController.h"
#import "selectPlanAbbrViewController.h"
#import "selectPlanAidViewController.h"
#import "selectPlanAid2ViewController.h"
#import "selectPlanCodeViewController.h"
#import "inputNumberFieldViewController.h"
#import "inputNumberViewController.h"
#import "selectPlanHeaderView.h"
#import "selectPlanFooterView.h"
#import "inputFieldCell.h"
#import "inputRelationViewController.h"

@interface planPickerViewController : tempViewController
<NIDropDownDelegate, selectPlanAbbrAction, selectPlanOrderAction,
selectPlanTypeAction, inputNumberDelegate, UITextFieldDelegate,
selectPlanHeaderAction, selectPlanCodeAction,inputRelationAction,
selectPlanCategoryAction,
UITableViewDataSource, UITableViewDelegate>
{
    NIDropDown *dropDown;
    IBOutlet UITableView *aTableView;
    NSArray *customerArray;
    BOOL isModify;
}

@property (nonatomic, retain) NSArray *customerArray;
@property (assign) BOOL isModify;

- (IBAction)selectProposal:(id)sender;

@end
