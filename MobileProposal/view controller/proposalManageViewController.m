//
//  proposalManageViewController.m
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "proposalManageViewController.h"
#import "HMSegmentedControl.h"

#import "saveProposalInfo.h"
#import "savePlanInfo.h"
#import "pldf.h"
#import "customerInfo.h"
#import "lfFundResult.h"
#import "planIntroResult.h"

typedef NS_ENUM(NSUInteger, proposalManageType) {
    proposalManageTypeInformation,
    proposalManageTypeDetail,
    proposalManageTypeProtection,
    proposalManageTypePayDetail,
};

@interface proposalManageViewController ()
{
    NSUInteger segmentIndex;
    customerInfo *i1Customer;
    customerInfo *o1Customer;
    PMInformationDelegate *informationDelegate;
    PMDetailDelegate *detailDelegate;
    PMProtectionContentDelegate *protectDelegate;
    PMPayDetailDelegate *payDetailDelegate;
    
    UISegmentedControl *segment;
    
    NSArray *planArray;
    NSArray *pldfArray;
    NSArray *customerArray;
    
    NSArray *fundResultArray;
    NSArray *planIntroResultArray;
}

- (void)createFakeData;
- (void)createResultData;
- (void)createBarItem;

- (void)createInformationToolbar;
- (void)createDetailToolbar;

- (void)addCustomerItemPress:(UIBarButtonItem*)item;
- (void)addPlanItemPress:(UIBarButtonItem*)item;
- (void)modxSegmentValueChange:(UISegmentedControl*)sender;

@end

@implementation proposalManageViewController
@synthesize aProposal, modalType;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"", @"");
        [self createFakeData];
        [self createResultData];
        if (informationDelegate == nil)
        {
            informationDelegate = [PMInformationDelegate new];
            [informationDelegate setPMTag:proposalManageTypeInformation];
            [informationDelegate setPlanArray:planArray];
            [informationDelegate setPldfArray:pldfArray];
            [informationDelegate setCustomerArray:customerArray];
        }
        if (detailDelegate == nil)
        {
            detailDelegate = [PMDetailDelegate new];
            [detailDelegate setPMTag:proposalManageTypeDetail];
            [detailDelegate setPlanArray:planArray];
            [detailDelegate setPldfArray:pldfArray];
            [detailDelegate setCustomerArray:customerArray];
        }
        if (protectDelegate == nil)
        {
            protectDelegate = [PMProtectionContentDelegate new];
            [protectDelegate setPMTag:proposalManageTypeProtection];
            [protectDelegate setPlanArray:planArray];
            [protectDelegate setPldfArray:pldfArray];
            [protectDelegate setPlanIntroArray:planIntroResultArray];
            [protectDelegate setCustomerArray:customerArray];
        }
        if (payDetailDelegate == nil)
        {
            payDetailDelegate = [PMPayDetailDelegate new];
            [payDetailDelegate setPMTag:proposalManageTypePayDetail];
            [payDetailDelegate setPlanArray:planArray];
            [payDetailDelegate setPldfArray:pldfArray];
            [payDetailDelegate setCustomerArray:customerArray];
            [payDetailDelegate setFundResultArray:fundResultArray];
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
    self.title = [NSString stringWithFormat:@"%@",aProposal.fileName==nil?@"":aProposal.fileName];
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [segmentedControl setSectionTitles:@[@"基本資訊", @"商品明細", @"保障內容", @"給付明細"]];
    [segmentedControl setSelectionIndicatorHeight:4.0f];
    [segmentedControl setBackgroundColor:[UIColor clearColor]];
    [segmentedControl setTextColor:[UIColor whiteColor]];
    [segmentedControl setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [segmentedControl setSelectionIndicatorColor:[UIColor redColor]];
    [segmentedControl setSelectionIndicatorMode:HMSelectionIndicatorFillsSegment];
    [segmentedControl setSegmentEdgeInset:UIEdgeInsetsMake(0, 6, 0, 6)];
    [segmentedControl setTag:2];
    [aTableView setTableHeaderView:segmentedControl];

    
    [informationDelegate setDelegate:self];
    [detailDelegate setDelegate:self];
    [protectDelegate setDelegate:self];
    [payDetailDelegate setDelegate:self];
    
    [aTableView setDelegate:informationDelegate];
    [aTableView setDataSource:informationDelegate];
    [aTableView setSeparatorColor:[UIColor clearColor]];
    
    UIView *emptyView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    [aTableView setTableFooterView:emptyView];
    [self createBarItem];
    [self createInformationToolbar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setToolbarHidden:YES animated:YES];
}

- (void)dealloc
{
    [aTableView release], aTableView = nil;
    [aProposal release], aProposal = nil;
    [o1Customer release], o1Customer = nil;
    [i1Customer release], i1Customer = nil;
    [planArray release], planArray = nil;
    [pldfArray release], pldfArray = nil;
    [customerArray release], customerArray = nil;
    [segment release], segment = nil;
    [informationDelegate release], informationDelegate = nil;
    [detailDelegate release], detailDelegate = nil;
    [protectDelegate release], protectDelegate = nil;
    [payDetailDelegate release], payDetailDelegate = nil;
    [fundResultArray release], fundResultArray = nil;
    [planIntroResultArray release], planIntroResultArray = nil;
    [super dealloc];
}

#pragma mark - HMSegment Action
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl
{
    NSLog(@"Selected index %i (via UIControlEventValueChanged)", segmentedControl.selectedSegmentIndex);
    NSUInteger segInd = [segmentedControl selectedSegmentIndex];
    segmentIndex = segInd;
    switch (segInd)
    {
        case proposalManageTypeInformation:
            [aTableView setDelegate:informationDelegate];
            [aTableView setDataSource:informationDelegate];
            [self createInformationToolbar];
            break;
        case proposalManageTypeDetail:
            [aTableView setDelegate:detailDelegate];
            [aTableView setDataSource:detailDelegate];
            [self createDetailToolbar];
            break;
        case proposalManageTypeProtection:
            [aTableView setDelegate:protectDelegate];
            [aTableView setDataSource:protectDelegate];
            [self.navigationController setToolbarHidden:YES animated:YES];
            break;
        case proposalManageTypePayDetail:
            [aTableView setDelegate:payDetailDelegate];
            [aTableView setDataSource:payDetailDelegate];
            [self.navigationController setToolbarHidden:YES animated:YES];
            break;
    }
    [aTableView reloadData];
}

#pragma mark - PMAction
- (void)PMActionDidSelectWithIndexPath:(NSIndexPath *)indexPath andTag:(NSUInteger)tag
{
    
}

#pragma mark - user define function
- (void)createBarItem
{
    if (modalType == 0)
        return;
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithTitle:@"關閉" style:UIBarButtonItemStylePlain target:self action:@selector(closeItemPress)];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:closeItem, nil];
    [closeItem release];
    UIBarButtonItem *createItem = [[UIBarButtonItem alloc] initWithTitle:@"建立" style:UIBarButtonItemStylePlain target:self action:@selector(createProposal:)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:createItem, nil];
    [createItem release];
}

- (void)closeItemPress
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)createProposal:(UIBarButtonItem*)sender
{
    
}

#pragma mark - 建立基本資料的toolbar
- (void)createInformationToolbar
{
    [self.navigationController setToolbarHidden:YES animated:YES];
    [segment removeFromSuperview];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *addCustomerItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCustomerItemPress:)];
    [self setToolbarItems:[NSArray arrayWithObjects:flexItem, addCustomerItem, nil] animated:YES];
    [addCustomerItem release];
    [flexItem release];
    [self.navigationController setToolbarHidden:NO animated:YES];
}

#pragma mark - 建立險種明細的toolbar
- (void)createDetailToolbar
{
    [self.navigationController setToolbarHidden:YES animated:YES];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *addPlanItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlanItemPress:)];
    if (segment == nil)
    {
        segment = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"年繳",@"半年繳",@"季繳",@"月繳", nil]];
        [segment setSegmentedControlStyle:UISegmentedControlStyleBar];
        [segment setFrame:CGRectMake(60, 8, 200, 30)];
        [segment setTintColor:[UIColor grayColor]];
        [segment addTarget:self action:@selector(modxSegmentValueChange:) forControlEvents:UIControlEventValueChanged];
        [segment setSelectedSegmentIndex:[detailDelegate modx]];
    }
    [self setToolbarItems:[NSArray arrayWithObjects:flexItem, addPlanItem, nil] animated:YES];
    [self.navigationController.toolbar addSubview:segment];
    [addPlanItem release];
    [flexItem release];
    [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)addCustomerItemPress:(UIBarButtonItem*)item
{
    
}

- (void)addPlanItemPress:(UIBarButtonItem*)item
{
    planPickerViewController *planPickerView = [[planPickerViewController alloc] initWithNibName:@"planPickerViewController" bundle:nil];
    [planPickerView setCustomerArray:customerArray];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:planPickerView];
    nav.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
    nav.toolbar.tintColor = self.navigationController.toolbar.tintColor;
    [self presentViewController:nav animated:YES completion:^{
    
    }];
    [planPickerView release];
}

- (void)modxSegmentValueChange:(UISegmentedControl*)sender
{
    [detailDelegate setModx:[sender selectedSegmentIndex]];
    [aTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)createFakeData
{
    i1Customer = [customerInfo new];
    i1Customer.name = [NSString stringWithFormat:@"張星星"];
    i1Customer.age = [NSNumber numberWithInteger:31];
    i1Customer.occuCode = [NSString stringWithFormat:@"01130"];
    
    o1Customer = [customerInfo new];
    i1Customer.name = [NSString stringWithFormat:@"張星星"];
    i1Customer.age = [NSNumber numberWithInteger:28];
    i1Customer.occuCode = [NSString stringWithFormat:@"01120"];
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
    savePlanInfo *plan = [savePlanInfo new];
    plan.planCode = [NSString stringWithFormat:@"20XWL"];
    plan.planDesc = [NSString stringWithFormat:@"20年繳費祥安終身壽險"];
    plan.planAbbrCode = [NSString stringWithFormat:@"XWL"];
    plan.faceAmt = [NSNumber numberWithInteger:100];
    plan.modePrem = [NSNumber numberWithDouble:29700];
    plan.yearPrem = [NSNumber numberWithDouble:29700];
    plan.halfPrem = [NSNumber numberWithDouble:15444];
    plan.seasonPrem = [NSNumber numberWithDouble:7781];
    plan.monPrem = [NSNumber numberWithDouble:2614];
    [array addObject:plan];
    [plan release];
    //醫療
    plan = [savePlanInfo new];
    plan.planCode = [NSString stringWithFormat:@"20HHIR"];
    plan.planDesc = [NSString stringWithFormat:@"20年繳費好健康終身醫療健康保險附約"];
    plan.planAbbrCode = [NSString stringWithFormat:@"HHIR"];
    plan.faceAmt = [NSNumber numberWithInteger:10];
    plan.modePrem = [NSNumber numberWithDouble:12090];
    plan.yearPrem = [NSNumber numberWithDouble:12090];
    plan.halfPrem = [NSNumber numberWithDouble:6287];
    plan.seasonPrem = [NSNumber numberWithDouble:3168];
    plan.monPrem = [NSNumber numberWithDouble:1064];
    [array addObject:plan];
    [plan release];
    plan = [savePlanInfo new];
    plan.planCode = [NSString stringWithFormat:@"HIR"];
    plan.planDesc = [NSString stringWithFormat:@"常春住院醫療保險附約住院及加護病房保險金"];
    plan.planAbbrCode = [NSString stringWithFormat:@"HIR"];
    plan.faceAmt = [NSNumber numberWithInteger:100];
    plan.modePrem = [NSNumber numberWithDouble:1750];
    plan.yearPrem = [NSNumber numberWithDouble:1750];
    plan.halfPrem = [NSNumber numberWithDouble:910];
    plan.seasonPrem = [NSNumber numberWithDouble:459];
    plan.monPrem = [NSNumber numberWithDouble:154];
    [array addObject:plan];
    [plan release];
    plan = [savePlanInfo new];
    plan.planCode = [NSString stringWithFormat:@"SIR"];
    plan.planDesc = [NSString stringWithFormat:@"常春住院醫療保險附約手術保險金"];
    plan.planAbbrCode = [NSString stringWithFormat:@"SIR"];
    plan.faceAmt = [NSNumber numberWithInteger:100];
    plan.modePrem = [NSNumber numberWithDouble:620];
    plan.yearPrem = [NSNumber numberWithDouble:620];
    plan.halfPrem = [NSNumber numberWithDouble:322];
    plan.seasonPrem = [NSNumber numberWithDouble:162];
    plan.monPrem = [NSNumber numberWithDouble:55];
    [array addObject:plan];
    [plan release];
    plan = [savePlanInfo new];
    plan.planCode = [NSString stringWithFormat:@"HCR"];
    plan.planDesc = [NSString stringWithFormat:@"常春住院醫療保險附約出院療養保險金"];
    plan.planAbbrCode = [NSString stringWithFormat:@"HCR"];
    plan.faceAmt = [NSNumber numberWithInteger:100];
    plan.modePrem = [NSNumber numberWithDouble:930];
    plan.yearPrem = [NSNumber numberWithDouble:930];
    plan.halfPrem = [NSNumber numberWithDouble:484];
    plan.seasonPrem = [NSNumber numberWithDouble:244];
    plan.monPrem = [NSNumber numberWithDouble:82];
    [array addObject:plan];
    [plan release];
    //意外
    plan = [savePlanInfo new];
    plan.planCode = [NSString stringWithFormat:@"ADDR"];
    plan.planDesc = [NSString stringWithFormat:@"意外身故及殘廢保險金"];
    plan.planAbbrCode = [NSString stringWithFormat:@"ADDR"];
    plan.faceAmt = [NSNumber numberWithInteger:100];
    plan.modePrem = [NSNumber numberWithDouble:1160];
    plan.yearPrem = [NSNumber numberWithDouble:1160];
    plan.halfPrem = [NSNumber numberWithDouble:603];
    plan.seasonPrem = [NSNumber numberWithDouble:304];
    plan.monPrem = [NSNumber numberWithDouble:102];
    [array addObject:plan];
    [plan release];
    plan = [savePlanInfo new];
    plan.planCode = [NSString stringWithFormat:@"AMRR"];
    plan.planDesc = [NSString stringWithFormat:@"每次實支實付傷害醫療保險金限額"];
    plan.planAbbrCode = [NSString stringWithFormat:@"AMRR"];
    plan.faceAmt = [NSNumber numberWithInteger:100];
    plan.modePrem = [NSNumber numberWithDouble:184];
    plan.yearPrem = [NSNumber numberWithDouble:184];
    plan.halfPrem = [NSNumber numberWithDouble:96];
    plan.seasonPrem = [NSNumber numberWithDouble:48];
    plan.monPrem = [NSNumber numberWithDouble:16];
    [array addObject:plan];
    [plan release];
    plan = [savePlanInfo new];
    plan.planCode = [NSString stringWithFormat:@"DHIR"];
    plan.planDesc = [NSString stringWithFormat:@"傷害醫療保險金日額"];
    plan.planAbbrCode = [NSString stringWithFormat:@"DHIR"];
    plan.faceAmt = [NSNumber numberWithInteger:10];
    plan.modePrem = [NSNumber numberWithDouble:620];
    plan.yearPrem = [NSNumber numberWithDouble:620];
    plan.halfPrem = [NSNumber numberWithDouble:322];
    plan.seasonPrem = [NSNumber numberWithDouble:162];
    plan.monPrem = [NSNumber numberWithDouble:55];
    [array addObject:plan];
    [plan release];
    
    planArray = [[NSArray alloc] initWithArray:array];
    
    NSMutableArray *array2 = [NSMutableArray arrayWithCapacity:0];
    
    pldf *aPldf = [pldf new];
    aPldf.planCode = [NSString stringWithFormat:@"20XWL"];
    aPldf.planDesc = [NSString stringWithFormat:@"20年繳費祥安終身壽險"];
    aPldf.planAbbrCode = [NSString stringWithFormat:@"XWL"];
    aPldf.unitValue = [NSNumber numberWithDouble:10000];
    aPldf.faceAmtType = [NSString stringWithFormat:@"1"];
    aPldf.premiumYearDur = [NSNumber numberWithInteger:20];
    aPldf.premiumYearAge = [NSNumber numberWithInteger:0];
    aPldf.coverageYearAge = [NSNumber numberWithInteger:105];
    aPldf.coverageYearDur = [NSNumber numberWithInteger:0];
    [array2 addObject:aPldf];
    [aPldf release];
    aPldf = [pldf new];
    aPldf.planCode = [NSString stringWithFormat:@"20HHIR"];
    aPldf.planDesc = [NSString stringWithFormat:@"20年繳費好健康終身醫療健康保險附約"];
    aPldf.planAbbrCode = [NSString stringWithFormat:@"HHIR"];
    aPldf.unitValue = [NSNumber numberWithDouble:10];
    aPldf.faceAmtType = [NSString stringWithFormat:@"1"];
    aPldf.premiumYearDur = [NSNumber numberWithInteger:20];
    aPldf.premiumYearAge = [NSNumber numberWithInteger:0];
    aPldf.coverageYearAge = [NSNumber numberWithInteger:105];
    aPldf.coverageYearDur = [NSNumber numberWithInteger:0];
    [array2 addObject:aPldf];
    [aPldf release];
    aPldf = [pldf new];
    aPldf.planCode = [NSString stringWithFormat:@"HIR"];
    aPldf.planDesc = [NSString stringWithFormat:@"常春住院醫療保險附約住院及加護病房保險金"];
    aPldf.planAbbrCode = [NSString stringWithFormat:@"HIR"];
    aPldf.unitValue = [NSNumber numberWithDouble:10];
    aPldf.faceAmtType = [NSString stringWithFormat:@"1"];
    aPldf.premiumYearDur = [NSNumber numberWithInteger:1];
    aPldf.premiumYearAge = [NSNumber numberWithInteger:0];
    aPldf.coverageYearAge = [NSNumber numberWithInteger:0];
    aPldf.coverageYearDur = [NSNumber numberWithInteger:1];
    [array2 addObject:aPldf];
    [aPldf release];
    aPldf = [pldf new];
    aPldf.planCode = [NSString stringWithFormat:@"SIR"];
    aPldf.planDesc = [NSString stringWithFormat:@"常春住院醫療保險附約手術保險金"];
    plan.planAbbrCode = [NSString stringWithFormat:@"SIR"];
    aPldf.unitValue = [NSNumber numberWithDouble:10];
    aPldf.faceAmtType = [NSString stringWithFormat:@"1"];
    aPldf.premiumYearDur = [NSNumber numberWithInteger:1];
    aPldf.premiumYearAge = [NSNumber numberWithInteger:0];
    aPldf.coverageYearAge = [NSNumber numberWithInteger:0];
    aPldf.coverageYearDur = [NSNumber numberWithInteger:1];
    [array2 addObject:aPldf];
    [aPldf release];
    aPldf = [pldf new];
    aPldf.planCode = [NSString stringWithFormat:@"HCR"];
    aPldf.planDesc = [NSString stringWithFormat:@"常春住院醫療保險附約出院療養保險金"];
    aPldf.planAbbrCode = [NSString stringWithFormat:@"HCR"];
    aPldf.unitValue = [NSNumber numberWithDouble:10];
    aPldf.faceAmtType = [NSString stringWithFormat:@"1"];
    aPldf.premiumYearDur = [NSNumber numberWithInteger:1];
    aPldf.premiumYearAge = [NSNumber numberWithInteger:0];
    aPldf.coverageYearAge = [NSNumber numberWithInteger:0];
    aPldf.coverageYearDur = [NSNumber numberWithInteger:1];
    [array2 addObject:aPldf];
    [aPldf release];
    //意外
    aPldf = [pldf new];
    aPldf.planCode = [NSString stringWithFormat:@"ADDR"];
    aPldf.planDesc = [NSString stringWithFormat:@"意外身故及殘廢保險金"];
    aPldf.planAbbrCode = [NSString stringWithFormat:@"ADDR"];
    aPldf.unitValue = [NSNumber numberWithDouble:10000];
    aPldf.faceAmtType = [NSString stringWithFormat:@"1"];
    aPldf.premiumYearDur = [NSNumber numberWithInteger:1];
    aPldf.premiumYearAge = [NSNumber numberWithInteger:0];
    aPldf.coverageYearAge = [NSNumber numberWithInteger:0];
    aPldf.coverageYearDur = [NSNumber numberWithInteger:1];
    [array2 addObject:aPldf];
    [aPldf release];
    aPldf = [pldf new];
    aPldf.planCode = [NSString stringWithFormat:@"AMRR"];
    aPldf.planDesc = [NSString stringWithFormat:@"每次實支實付傷害醫療保險金限額"];
    aPldf.planAbbrCode = [NSString stringWithFormat:@"AMRR"];
    aPldf.unitValue = [NSNumber numberWithDouble:10000];
    aPldf.faceAmtType = [NSString stringWithFormat:@"1"];
    aPldf.premiumYearDur = [NSNumber numberWithInteger:1];
    aPldf.premiumYearAge = [NSNumber numberWithInteger:0];
    aPldf.coverageYearAge = [NSNumber numberWithInteger:0];
    aPldf.coverageYearDur = [NSNumber numberWithInteger:1];
    [array2 addObject:aPldf];
    [aPldf release];
    aPldf = [pldf new];
    aPldf.planCode = [NSString stringWithFormat:@"DHIR"];
    aPldf.planDesc = [NSString stringWithFormat:@"傷害醫療保險金日額"];
    aPldf.planAbbrCode = [NSString stringWithFormat:@"DHIR"];
    aPldf.unitValue = [NSNumber numberWithDouble:10];
    aPldf.faceAmtType = [NSString stringWithFormat:@"1"];
    aPldf.premiumYearDur = [NSNumber numberWithInteger:1];
    aPldf.premiumYearAge = [NSNumber numberWithInteger:0];
    aPldf.coverageYearAge = [NSNumber numberWithInteger:0];
    aPldf.coverageYearDur = [NSNumber numberWithInteger:1];
    [array2 addObject:aPldf];
    [aPldf release];
    
    pldfArray = [[NSArray alloc] initWithArray:array2];
    
    NSMutableArray *array3 = [NSMutableArray arrayWithCapacity:0];
    
    customerInfo *customer = [customerInfo new];
    customer.name = [NSString stringWithFormat:@"張星星"];
    customer.sex = [NSString stringWithFormat:@"1"];
    customer.occuCode = [NSString stringWithFormat:@"01130"];
    customer.age = [NSNumber numberWithInteger:30];
    customer.relation = relationO1;
    customer.relationName = [NSString stringWithFormat:@"要保人"];
    [array3 addObject:customer];
    [customer release];
    customer = [customerInfo new];
    customer.name = [NSString stringWithFormat:@"派大星"];
    customer.sex = [NSString stringWithFormat:@"1"];
    customer.occuCode = [NSString stringWithFormat:@"01130"];
    customer.age = [NSNumber numberWithInteger:30];
    customer.relation = relationI1;
    customer.relationName = [NSString stringWithFormat:@"被保人"];
    [array3 addObject:customer];
    [customer release];
    customer = [customerInfo new];
    customer.name = [NSString stringWithFormat:@"海綿寶寶"];
    customer.sex = [NSString stringWithFormat:@"2"];
    customer.occuCode = [NSString stringWithFormat:@"01120"];
    customer.age = [NSNumber numberWithInteger:28];
    customer.relation = relationSS;
    customer.relationName = [NSString stringWithFormat:@"配偶"];
    [array3 addObject:customer];
    [customer release];
    customer = [customerInfo new];
    customer.name = [NSString stringWithFormat:@"美國隊長"];
    customer.sex = [NSString stringWithFormat:@"1"];
    customer.occuCode = [NSString stringWithFormat:@"01130"];
    customer.age = [NSNumber numberWithInteger:10];
    customer.relation = relationC;
    customer.relationName = [NSString stringWithFormat:@"小孩"];
    [array3 addObject:customer];
    [customer release];
    customer = [customerInfo new];
    customer.name = [NSString stringWithFormat:@"蜘蛛人"];
    customer.sex = [NSString stringWithFormat:@"2"];
    customer.occuCode = [NSString stringWithFormat:@"01130"];
    customer.age = [NSNumber numberWithInteger:4];
    customer.relation = relationC;
    customer.relationName = [NSString stringWithFormat:@"小孩"];
    [array3 addObject:customer];
    [customer release];
    
    customerArray = [[NSArray alloc] initWithArray:array3];
}

- (void)createResultData
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    lfFundResult *fund = [lfFundResult new];
    fund.fundSeq = [NSNumber numberWithInteger:10000];
    fund.fundContent = [NSString stringWithFormat:@"傷病住院醫療定額給付"];
    fund.fund1 = [NSNumber numberWithInteger:-1];
    fund.fund2 = [NSNumber numberWithInteger:-1];
    fund.fund3 = [NSNumber numberWithInteger:-1];
    [array addObject:fund];
    [fund release];
    fund = [lfFundResult new];
    fund.fundSeq = [NSNumber numberWithInteger:10001];
    fund.fundContent = [NSString stringWithFormat:@"住院醫療日額(每日)"];
    fund.fund1 = [NSNumber numberWithInteger:2000];
    fund.fund2 = [NSNumber numberWithInteger:2000];
    fund.fund3 = [NSNumber numberWithInteger:2000];
    [array addObject:fund];
    [fund release];
    fund = [lfFundResult new];
    fund.fundSeq = [NSNumber numberWithInteger:10002];
    fund.fundContent = [NSString stringWithFormat:@"加護病房或燒燙傷傷病房(每日)"];
    fund.fund1 = [NSNumber numberWithInteger:2000];
    fund.fund2 = [NSNumber numberWithInteger:2000];
    fund.fund3 = [NSNumber numberWithInteger:2000];
    [array addObject:fund];
    [fund release];
    fund = [lfFundResult new];
    fund.fundSeq = [NSNumber numberWithInteger:10003];
    fund.fundContent = [NSString stringWithFormat:@"救護車緊急轉送醫院(每次)"];
    fund.fund1 = [NSNumber numberWithInteger:1500];
    fund.fund2 = [NSNumber numberWithInteger:0];
    fund.fund3 = [NSNumber numberWithInteger:0];
    [array addObject:fund];
    [fund release];
    fund = [lfFundResult new];
    fund.fundSeq = [NSNumber numberWithInteger:10004];
    fund.fundContent = [NSString stringWithFormat:@"出院療養日額(每日)"];
    fund.fund1 = [NSNumber numberWithInteger:1000];
    fund.fund2 = [NSNumber numberWithInteger:1000];
    fund.fund3 = [NSNumber numberWithInteger:0];
    [array addObject:fund];
    [fund release];
    fund = [lfFundResult new];
    fund.fundSeq = [NSNumber numberWithInteger:10005];
    fund.fundContent = [NSString stringWithFormat:@"住院前後門診(每日)"];
    fund.fund1 = [NSNumber numberWithInteger:500];
    fund.fund2 = [NSNumber numberWithInteger:500];
    fund.fund3 = [NSNumber numberWithInteger:500];
    [array addObject:fund];
    [fund release];
    fund = [lfFundResult new];
    fund.fundSeq = [NSNumber numberWithInteger:20000];
    fund.fundContent = [NSString stringWithFormat:@"傷病住院醫療實支實付"];
    fund.fund1 = [NSNumber numberWithInteger:-1];
    fund.fund2 = [NSNumber numberWithInteger:-1];
    fund.fund3 = [NSNumber numberWithInteger:-1];
    [array addObject:fund];
    [fund release];
    fund = [lfFundResult new];
    fund.fundSeq = [NSNumber numberWithInteger:20001];
    fund.fundContent = [NSString stringWithFormat:@"每日病房費用限額"];
    fund.fund1 = [NSNumber numberWithInteger:1000];
    fund.fund2 = [NSNumber numberWithInteger:0];
    fund.fund3 = [NSNumber numberWithInteger:0];
    [array addObject:fund];
    [fund release];

    fund = [lfFundResult new];
    fund.fundSeq = [NSNumber numberWithInteger:20002];
    fund.fundContent = [NSString stringWithFormat:@"手術醫療費用限額"];
    fund.fund1 = [NSNumber numberWithInteger:1000];
    fund.fund2 = [NSNumber numberWithInteger:0];
    fund.fund3 = [NSNumber numberWithInteger:-0];
    [array addObject:fund];
    [fund release];

    fund = [lfFundResult new];
    fund.fundSeq = [NSNumber numberWithInteger:20003];
    fund.fundContent = [NSString stringWithFormat:@"住院醫療費用限額"];
    fund.fund1 = [NSNumber numberWithInteger:1000];
    fund.fund2 = [NSNumber numberWithInteger:0];
    fund.fund3 = [NSNumber numberWithInteger:0];
    [array addObject:fund];
    [fund release];

    fund = [lfFundResult new];
    fund.fundSeq = [NSNumber numberWithInteger:20004];
    fund.fundContent = [NSString stringWithFormat:@"傷害醫療費用限額"];
    fund.fund1 = [NSNumber numberWithInteger:1000];
    fund.fund2 = [NSNumber numberWithInteger:0];
    fund.fund3 = [NSNumber numberWithInteger:0];
    [array addObject:fund];
    [fund release];

    fundResultArray = [[NSArray alloc] initWithArray:array];
    
    NSMutableArray *array2= [NSMutableArray arrayWithCapacity:0];
    
    planIntroResult *intro = [planIntroResult new];
    intro.seq = [NSNumber numberWithInteger:0];
    intro.introduction = [NSString stringWithFormat:@"海外緊急救援服務"];
    [array2 addObject:intro];
    [intro release];
    
    intro = [planIntroResult new];
    intro.seq = [NSNumber numberWithInteger:1];
    intro.introduction = [NSString stringWithFormat:@"國人近年來旅外洽公、經商、旅遊機會大增，相對海外服務也更形重要。xxxx人壽特別為保戶提供免費電話全球旅遊咨詢及完整的海外急難救助，更顯您的尊榮。"];
    [array2 addObject:intro];
    [intro release];
    intro = [planIntroResult new];
    intro.seq = [NSNumber numberWithInteger:0];
    intro.introduction = [NSString stringWithFormat:@"自動轉帳、信用卡代收、集體彙繳可享保費優惠"];
    [array2 addObject:intro];
    [intro release];
    intro = [planIntroResult new];
    intro.seq = [NSNumber numberWithInteger:1];
    intro.introduction = [NSString stringWithFormat:@"1.保戶續期保賴以自動轉帳、信用卡代墊(僅三商企業聯名卡)方式繳保費，可享降低當期1%%保費優惠(外幣保單僅可自動轉帳)。"];
    [array2 addObject:intro];
    [intro release];
    intro = [planIntroResult new];
    intro.seq = [NSNumber numberWithInteger:2];
    intro.introduction = [NSString stringWithFormat:@"2.同一公司、行號、機關或單位內所屬員工或為正式員工之直系親屬或配偶，合乎上述資格人員五人(含)以上，經本公司及要保人同意，限定以自動轉帳方式按期繳付保 險費者，得成立「集體彙繳團體」享受保費之降低，彙繳降低率：少保費x2%%(彙繳降低率1%%+自動轉帳1%%)。詳細優惠辦法或申請手續，請洽您的壽險業務員(外幣保單除外)。"];
    [array2 addObject:intro];
    [intro release];
    
    planIntroResultArray = [[NSArray alloc] initWithArray:array2];
}
@end
