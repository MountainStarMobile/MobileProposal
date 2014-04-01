//
//  saleManageViewController.m
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "saleManageViewController.h"
#import "HMSegmentedControl.h"

@interface saleManageViewController ()
{
    SMCustomerDelegate *SMCustomer;
    SMProposalDelegate *SMProposal;
    SMScheduleDelegate *SMSchedule;
    SMSaleDelegate *SMSale;
}

@end

@implementation saleManageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"業績管理", @"");
        if (SMCustomer == nil)
        {
            SMCustomer = [[SMCustomerDelegate alloc] init];
            [SMCustomer setSMTag:0];
        }
        if (SMProposal == nil)
        {
            SMProposal = [[SMProposalDelegate alloc] init];
            [SMProposal setSMTag:1];
        }
        if (SMSchedule == nil)
        {
            SMSchedule = [[SMScheduleDelegate alloc] init];
            [SMSchedule setSMTag:2];
        }
        if (SMSale == nil)
        {
            SMSale = [[SMSaleDelegate alloc] init];
            [SMSale setSMTag:3];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [segmentedControl setSectionTitles:@[@"客戶", @"提案", @"行程", @"業績"]];
    [segmentedControl setSelectionIndicatorHeight:4.0f];
    [segmentedControl setBackgroundColor:[UIColor clearColor]];
    [segmentedControl setTextColor:[UIColor whiteColor]];
    [segmentedControl setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    [segmentedControl setSelectionIndicatorColor:[UIColor redColor]];
    [segmentedControl setSelectionIndicatorMode:HMSelectionIndicatorFillsSegment];
    [segmentedControl setSegmentEdgeInset:UIEdgeInsetsMake(0, 6, 0, 6)];
    [segmentedControl setTag:3];
    
    [SMCustomer setDelegate:self];
    [SMProposal setDelegate:self];
    [SMSchedule setDelegate:self];
    [SMSale setDelegate:self];
    
    [aTableView setDelegate:SMCustomer];
    [aTableView setDataSource:SMCustomer];
    
    [aTableView setTableHeaderView:segmentedControl];
    
    UIView *emptyView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    [aTableView setTableFooterView:emptyView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [aTableView release], aTableView = nil;
    [super dealloc];
}


#pragma mark - HMSegment Action
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl
{
	NSLog(@"Selected index %i (via UIControlEventValueChanged)", segmentedControl.selectedSegmentIndex);
    NSInteger index = [segmentedControl selectedSegmentIndex];
    switch (index)
    {
        case 0:
            [aTableView setDelegate:SMCustomer];
            [aTableView setDataSource:SMCustomer];
            break;
        case 1:
            [aTableView setDelegate:SMProposal];
            [aTableView setDataSource:SMProposal];
            break;
        case 2:
            [aTableView setDelegate:SMSchedule];
            [aTableView setDataSource:SMSchedule];
            break;
        case 3:
            [aTableView setDelegate:SMSale];
            [aTableView setDataSource:SMSale];
            break;
        default:
            [aTableView setDelegate:SMCustomer];
            [aTableView setDataSource:SMCustomer];
            break;
    }
    [aTableView reloadData];
}

#pragma mark - SMAction
- (void)SMActionDidSelectWithIndexPath:(NSIndexPath *)indexPath andTag:(NSUInteger)tag
{
    
}

@end
