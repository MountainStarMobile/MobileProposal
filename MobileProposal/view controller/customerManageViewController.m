//
//  customerManageViewController.m
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "customerManageViewController.h"
#import "customerInfo.h"
#import "customerContaceInfo.h"
#import "saveProposalInfo.h"
#import "savePlanInfo.h"
#import "customerRelationInfo.h"
#import "proposalManageViewController.h"
#import "infoPanel.h"

typedef NS_ENUM(NSUInteger, customerManageType) {
    customerManageTypeInformation,
    customerManageTypeContactLog,
    customerManageTypeProposalType,
    customerManageTypeRelationLog,
};

@interface customerManageViewController () <CMAction>
{
    CMInformationDelegate *informationDelegate;
    CMContactLogDelegate *contactLogDelegate;
    CMProposalLogDelegate *proposalLogDelegate;
    CMRelationLogDelegate *relationLogDelegate;
    NSArray *contactLogArray;
    NSArray *saveProposalArray;
    NSArray *relationArray;
}

- (void)showWebViewWithUrl:(NSURL*)aUrl;
- (void)createFakeData;
- (void)createFAkeProposalData;
- (void)createFakeRelationData;

- (void)createLeftBarItem;
- (void)createInformationBarItem;
- (void)createContactLogBarItem;
- (void)createproposalBarItem;
- (void)createRelationBarItem;

- (void)closeItemPress:(UIBarButtonItem*)item;
- (customerInfo*)findCustomerWithClientId:(NSString*)clientid;

@end

@implementation customerManageViewController
@synthesize aCustomer, modalType, isModify;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"", @"");
        [self createFakeData];
        [self createFAkeProposalData];
        [self createFakeRelationData];
        if (informationDelegate == nil)
        {
            informationDelegate = [CMInformationDelegate new];
            [informationDelegate setCMTag:0];
        }
        if (contactLogDelegate == nil)
        {
            contactLogDelegate = [CMContactLogDelegate new];
            [contactLogDelegate setCMTag:1];
        }
        if (proposalLogDelegate == nil)
        {
            proposalLogDelegate = [CMProposalLogDelegate new];
            [proposalLogDelegate setCMTag:2];
        }
        if (relationLogDelegate == nil)
        {
            relationLogDelegate = [[CMRelationLogDelegate alloc] initWithRelationArray:relationArray];
            [relationLogDelegate setCMTag:3];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = aCustomer.name;
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];

    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [segmentedControl setSectionTitles:@[@"基本資料", @"聯繫記錄", @"提案記錄", @"人脈關聯"]];
    [segmentedControl setSelectionIndicatorHeight:4.0f];
    [segmentedControl setBackgroundColor:[UIColor clearColor]];
    [segmentedControl setTextColor:[UIColor whiteColor]];
    [segmentedControl setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [segmentedControl setSelectionIndicatorColor:[UIColor redColor]];
    [segmentedControl setSelectionIndicatorMode:HMSelectionIndicatorFillsSegment];
    [segmentedControl setSegmentEdgeInset:UIEdgeInsetsMake(0, 6, 0, 6)];
    [segmentedControl setSelectedSegmentIndex:0];
    [segmentedControl setTag:0];
    [aTableView setTableHeaderView:segmentedControl];
    //設定參數值
    [informationDelegate setDelegate:self];
    [informationDelegate setCMInformation:self];
    [informationDelegate setACustomer:aCustomer];
    [contactLogDelegate setDelegate:self];
    [contactLogDelegate setContactLogArray:contactLogArray];
    [contactLogDelegate setACustomer:aCustomer];
    [proposalLogDelegate setDelegate:self];
    [proposalLogDelegate setACustomer:aCustomer];
    [proposalLogDelegate setProposalArray:saveProposalArray];
    [relationLogDelegate setDelegate:self];
    [relationLogDelegate setCmRelationDelegate:self];
    [relationLogDelegate setACustomer:aCustomer];
    
    [aTableView setDelegate:informationDelegate];
    [aTableView setDataSource:informationDelegate];
    
    UIView *emptyView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    [aTableView setTableFooterView:emptyView];
    [self createLeftBarItem];
    [self createInformationBarItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [aTableView release], aTableView = nil;
    [informationDelegate release], informationDelegate = nil;
    [contactLogDelegate release], contactLogDelegate = nil;
    [proposalLogDelegate release], proposalLogDelegate = nil;
    [relationLogDelegate release], relationLogDelegate = nil;
    [aCustomer release], aCustomer = nil;
    [contactLogArray release], contactLogArray = nil;
    [relationArray release], relationArray = nil;
    [super dealloc];
}

#pragma mark - HMSegment Action
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl
{
	NSLog(@"Selected index %i (via UIControlEventValueChanged)", segmentedControl.selectedSegmentIndex);
    NSUInteger segInd = [segmentedControl selectedSegmentIndex];
    switch (segInd)
    {
        case customerManageTypeInformation:
            [aTableView setDelegate:informationDelegate];
            [aTableView setDataSource:informationDelegate];
            [self createInformationBarItem];
            break;
        case customerManageTypeContactLog:
            [aTableView setDelegate:contactLogDelegate];
            [aTableView setDataSource:contactLogDelegate];
            [self createContactLogBarItem];
            break;
        case customerManageTypeProposalType:
            [aTableView setDelegate:proposalLogDelegate];
            [aTableView setDataSource:proposalLogDelegate];
            [self createproposalBarItem];
            break;
        case customerManageTypeRelationLog:
            [aTableView setDelegate:relationLogDelegate];
            [aTableView setDataSource:relationLogDelegate];
            [self createRelationBarItem];
            break;
    }
    [aTableView reloadData];
}

#pragma mark  - CMAction
- (void)CMActionDidSelectWithIndexPath:(NSIndexPath *)indexPath andTag:(NSUInteger)tag
{
    if (modalType == 1)
    {
        [infoPanel showPanelInView:self.view type:infoPanelTypeInfo title:@"抱歉" subTitle:@"避免重覆開啟" hideAfter:2];
        return;
    }
    NSInteger row = [indexPath row];
    if (tag == customerManageTypeProposalType)
    {
        saveProposalInfo *info = [saveProposalArray objectAtIndex:row];
        proposalManageViewController *proposalManageView = [[proposalManageViewController alloc] initWithNibName:@"proposalManageViewController" bundle:nil];
        [proposalManageView setModalType:1];
        [proposalManageView setAProposal:info];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:proposalManageView];
        nav.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
        nav.toolbar.tintColor = self.navigationController.toolbar.tintColor;
        [self presentViewController:nav animated:YES completion:^{
        
        }];
        [proposalManageView release];
    }
}

#pragma mark - CMInformationAction
- (void)didOpenFacebookUrl
{
    [self showWebViewWithUrl:[NSURL URLWithString:aCustomer.facebook]];
}

- (void)didOpenGooglePlusUrl
{
    [self showWebViewWithUrl:[NSURL URLWithString:aCustomer.googlePlus]];
}

#pragma mark - cmRelationAction
- (void)didSelectRelationCellWithClientId:(NSString *)clientId
{
    if (modalType == 1)
    {
        [infoPanel showPanelInView:self.view type:infoPanelTypeInfo title:@"抱歉" subTitle:@"避免重覆開啟" hideAfter:2];
        return;
    }
    customerInfo *customer = [self findCustomerWithClientId:clientId];
    customerManageViewController *customerManageView = [[customerManageViewController alloc] initWithNibName:@"customerManageViewController" bundle:nil];
    [customerManageView setModalType:1];
    [customerManageView setACustomer:customer];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:customerManageView];
    [nav setTitle:clientId];
    nav.toolbar.tintColor = self.navigationController.toolbar.tintColor;
    nav.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
    
    [self presentViewController:nav animated:YES completion:^{
    
    }];
    
    [customerManageView release];
    [nav release];
}

#pragma mark - TSMiniWebBrowserDelegate

-(void) tsMiniWebBrowserDidDismiss
{
    NSLog(@"TSMiniWebBrowser was dismissed");
}

- (void) showWebViewWithUrl:(NSURL*)aUrl
{
    TSMiniWebBrowser *webBrowser = [[TSMiniWebBrowser alloc] initWithUrl:aUrl];
    webBrowser.delegate = self;
    //    webBrowser.showURLStringOnActionSheetTitle = YES;
    //    webBrowser.showPageTitleOnTitleBar = YES;
    //    webBrowser.showActionButton = YES;
    //    webBrowser.showReloadButton = YES;
    //[webBrowser setFixedTitleBarText:@"Test Title Text"]; // This has priority over "showPageTitleOnTitleBar".
    webBrowser.mode = TSMiniWebBrowserModeModal;
    
    webBrowser.barStyle = UIBarStyleBlack;
    
    if (webBrowser.mode == TSMiniWebBrowserModeModal)
    {
        webBrowser.modalDismissButtonTitle = @"Close";
        [self presentViewController:webBrowser animated:YES completion:^{}];
    }
    else if(webBrowser.mode == TSMiniWebBrowserModeNavigation)
    {
        [self.navigationController pushViewController:webBrowser animated:YES];
    }
}

#pragma mark - 建立navigationbar item
- (void)createLeftBarItem
{
    if (modalType == 0)
        return;
    UIBarButtonItem *CloseItem = [[UIBarButtonItem alloc] initWithTitle:@"關閉" style:UIBarButtonItemStylePlain target:self action:@selector(closeItemPress:)];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObject:CloseItem];
    [CloseItem release];
}
#pragma mark - 建立客戶基本資訊
- (void)createInformationBarItem
{
    if (modalType == 1)
    {
        return;
    }
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithTitle:@"編輯" style:UIBarButtonItemStylePlain target:self action:@selector(modifyCustomerInformation)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObject:editItem];
    [editItem release];
}

- (void)modifyCustomerInformation
{
    customerCreateTableViewController *customerCreateView = [[customerCreateTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [customerCreateView setACustomer:aCustomer];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:customerCreateView];
    nav.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
    [nav setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [nav setModalPresentationStyle:UIModalPresentationFullScreen];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
    [customerCreateView release];
    [nav release];
}

#pragma mark - 建立聯絡紀錄
- (void)createContactLogBarItem
{
    if (modalType == 1)
    {
        return;
    }
    self.navigationItem.rightBarButtonItems = nil;
}

#pragma mark - 建立提案管理
- (void)createproposalBarItem
{
    if (modalType == 1)
    {
        return;
    }
    UIBarButtonItem *createItem = [[UIBarButtonItem alloc] initWithTitle:@"建立" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObject:createItem];
    [createItem release];
}

#pragma mark - 建立人脈關聯
- (void)createRelationBarItem
{
    if (modalType == 1)
    {
        return;
    }
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithTitle:@"建立" style:UIBarButtonItemStylePlain target:self action:@selector(createRelationItem:)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObject:addItem];
    [addItem release];
}

- (void)closeItemPress:(UIBarButtonItem*)item
{
    [self dismissViewControllerAnimated:YES completion:^{
    
    }];
}

- (void)createRelationItem:(id)sender
{
    
}

- (customerInfo*)findCustomerWithClientId:(NSString*)clientid
{
    //NSString *para = [NSString stringWithFormat:@"clientId='%@'", clientid];
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:para];
    customerInfo *customer = [customerInfo new];
    customer.name = [NSString stringWithFormat:@"陳正賢"];
    customer.sex = [NSString stringWithFormat:@"1"];
    customer.birthDate = [NSString stringWithFormat:@"1983/08/17"];
    customer.cellPhone = [NSString stringWithFormat:@"0933042565"];
    customer.nickName = [NSString stringWithFormat:@"關係-陳正賢"];
    customer.education = [NSString stringWithFormat:@"3"];
    customer.tel1 = [NSString stringWithFormat:@"02-26181638"];
    customer.tel2 = [NSString stringWithFormat:@"02-23455511,528"];
    customer.email = [NSString stringWithFormat:@"sinss0000@gmail.com"];
    customer.occuCode = [NSString stringWithFormat:@"01130"];
    customer.facebook = [NSString stringWithFormat:@"https://www.facebook.com/sinss0000"];
    customer.googlePlus = [NSString stringWithFormat:@"https://plus.google.com/u/0/112076371353221753077/posts"];
    return [customer autorelease];
}

#pragma mark - 建立假資料
- (void)createFakeData
{
    /*
     聯繫紀錄
     */
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
    customerContaceInfo *info = [customerContaceInfo new];
    info.date = [NSString stringWithFormat:@"2013-01-01"];
    info.content = [NSString stringWithFormat:@"電話聯繫"];
    info.status = [NSString stringWithFormat:@"000"];
    info.statusMessage = [NSString stringWithFormat:@"已結束"];
    [array addObject:info];
    [info release];
    
    info = [customerContaceInfo new];
    info.date = [NSString stringWithFormat:@"2013-01-02"];
    info.content = [NSString stringWithFormat:@"商品介紹"];
    info.status = [NSString stringWithFormat:@"000"];
    info.statusMessage = [NSString stringWithFormat:@"已結束"];
    [array addObject:info];
    [info release];
    
    info = [customerContaceInfo new];
    info.date = [NSString stringWithFormat:@"2013-01-03"];
    info.content = [NSString stringWithFormat:@"收取簽核文件"];
    info.status = [NSString stringWithFormat:@"001"];
    info.statusMessage = [NSString stringWithFormat:@"完成"];
    [array addObject:info];
    [info release];
    
    info = [customerContaceInfo new];
    info.date = [NSString stringWithFormat:@"2013-01-04"];
    info.content = [NSString stringWithFormat:@"登門拜訪"];
    info.status = [NSString stringWithFormat:@"003"];
    info.statusMessage = [NSString stringWithFormat:@"進行中"];
    [array addObject:info];
    [info release];
    
    info = [customerContaceInfo new];
    info.date = [NSString stringWithFormat:@"2013-01-05"];
    info.content = [NSString stringWithFormat:@"保單送件"];
    info.status = [NSString stringWithFormat:@"004"];
    info.statusMessage = [NSString stringWithFormat:@"未完成"];
    [array addObject:info];
    [info release];
    
    info = [customerContaceInfo new];
    info.date = [NSString stringWithFormat:@"2013-01-06"];
    info.content = [NSString stringWithFormat:@"電話聯繫"];
    info.status = [NSString stringWithFormat:@"000"];
    info.statusMessage = [NSString stringWithFormat:@"已結束"];
    [array addObject:info];
    [info release];
    
    info = [customerContaceInfo new];
    info.date = [NSString stringWithFormat:@"2013-01-07"];
    info.content = [NSString stringWithFormat:@"送保單"];
    info.status = [NSString stringWithFormat:@"005"];
    info.statusMessage = [NSString stringWithFormat:@"退件"];
    [array addObject:info];
    [info release];
    
    info = [customerContaceInfo new];
    info.date = [NSString stringWithFormat:@"2013-01-08"];
    info.content = [NSString stringWithFormat:@"送保單"];
    info.status = [NSString stringWithFormat:@"003"];
    info.statusMessage = [NSString stringWithFormat:@"進行中"];
    [array addObject:info];
    [info release];
    
    contactLogArray = [[NSArray alloc] initWithArray:array];
}

- (void)createFAkeProposalData
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
    saveProposalInfo *proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"好康健終身醫療保險組合"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-11"];
    proposal.modx = [NSString stringWithFormat:@"6"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    [array addObject:proposal];
    [proposal release];
    
    proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"珍愛久久商品組合"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-10"];
    proposal.modx = [NSString stringWithFormat:@"3"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    [array addObject:proposal];
    [proposal release];
    
    proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"投資型保險組合"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-09"];
    proposal.modx = [NSString stringWithFormat:@"1"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    [array addObject:proposal];
    [proposal release];
    
    proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"一本萬利外幣險"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-08"];
    proposal.modx = [NSString stringWithFormat:@"1"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    [array addObject:proposal];
    [proposal release];
    
    proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"養老險組合"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-07"];
    proposal.modx = [NSString stringWithFormat:@"6"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    [array addObject:proposal];
    [proposal release];
    
    proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"意外險組合"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-06"];
    proposal.modx = [NSString stringWithFormat:@"12"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    [array addObject:proposal];
    [proposal release];
    
    proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"防癌醫療商品組合"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-05"];
    proposal.modx = [NSString stringWithFormat:@"12"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    [array addObject:proposal];
    [proposal release];
    
    proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"實支實付醫療險組合"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-04"];
    proposal.modx = [NSString stringWithFormat:@"3"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    [array addObject:proposal];
    [proposal release];
    saveProposalArray = [[NSArray alloc] initWithArray:array];
}

- (void)createFakeRelationData
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    //父母
    customerRelationInfo *info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"0"];
    info.relationId = [NSString stringWithFormat:@"F000000002"];
    info.relationName = [NSString stringWithFormat:@"張爸爸"];
    [array addObject:info];
    [info release];
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"0"];
    info.relationId = [NSString stringWithFormat:@"F000000005"];
    info.relationName = [NSString stringWithFormat:@"張媽媽"];
    [array addObject:info];
    [info release];
    //小孩
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"1"];
    info.relationId = [NSString stringWithFormat:@"F000000003"];
    info.relationName = [NSString stringWithFormat:@"派大星"];
    [array addObject:info];
    [info release];
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"1"];
    info.relationId = [NSString stringWithFormat:@"F000000006"];
    info.relationName = [NSString stringWithFormat:@"海棉寶寶"];
    [array addObject:info];
    [info release];
    //主管
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"2"];
    info.relationId = [NSString stringWithFormat:@"F000000004"];
    info.relationName = [NSString stringWithFormat:@"馬總統"];
    [array addObject:info];
    [info release];
    //屬下
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"3"];
    info.relationId = [NSString stringWithFormat:@"F000000007"];
    info.relationName = [NSString stringWithFormat:@"小蔡"];
    [array addObject:info];
    [info release];
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"3"];
    info.relationId = [NSString stringWithFormat:@"F000000008"];
    info.relationName = [NSString stringWithFormat:@"老李"];
    [array addObject:info];
    [info release];
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"3"];
    info.relationId = [NSString stringWithFormat:@"F000000009"];
    info.relationName = [NSString stringWithFormat:@"小張"];
    [array addObject:info];
    [info release];
    //兄弟
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"4"];
    info.relationId = [NSString stringWithFormat:@"F000000010"];
    info.relationName = [NSString stringWithFormat:@"張弟弟"];
    [array addObject:info];
    [info release];
    //姐妹
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"5"];
    info.relationId = [NSString stringWithFormat:@"F000000011"];
    info.relationName = [NSString stringWithFormat:@"張姐姐"];
    [array addObject:info];
    [info release];
    //朋友
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"6"];
    info.relationId = [NSString stringWithFormat:@"F000000012"];
    info.relationName = [NSString stringWithFormat:@"美國隊長"];
    [array addObject:info];
    [info release];
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"6"];
    info.relationId = [NSString stringWithFormat:@"F000000013"];
    info.relationName = [NSString stringWithFormat:@"蜘蛛人"];
    [array addObject:info];
    [info release];
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"6"];
    info.relationId = [NSString stringWithFormat:@"F000000014"];
    info.relationName = [NSString stringWithFormat:@"超人"];
    [array addObject:info];
    [info release];
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"6"];
    info.relationId = [NSString stringWithFormat:@"F000000015"];
    info.relationName = [NSString stringWithFormat:@"金剛狼"];
    [array addObject:info];
    [info release];
    //配偶
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"7"];
    info.relationId = [NSString stringWithFormat:@"F000000016"];
    info.relationName = [NSString stringWithFormat:@"飄撇阿凌"];
    [array addObject:info];
    [info release];
    //情侶
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"8"];
    info.relationId = [NSString stringWithFormat:@"F000000017"];
    info.relationName = [NSString stringWithFormat:@"老李"];
    [array addObject:info];
    [info release];
    //同事
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"9"];
    info.relationId = [NSString stringWithFormat:@"F000000018"];
    info.relationName = [NSString stringWithFormat:@"陳正賢"];
    [array addObject:info];
    [info release];
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"9"];
    info.relationId = [NSString stringWithFormat:@"F000000019"];
    info.relationName = [NSString stringWithFormat:@"陳威有"];
    [array addObject:info];
    [info release];
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"9"];
    info.relationId = [NSString stringWithFormat:@"F000000020"];
    info.relationName = [NSString stringWithFormat:@"李宗瑞"];
    [array addObject:info];
    [info release];
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"9"];
    info.relationId = [NSString stringWithFormat:@"F000000021"];
    info.relationName = [NSString stringWithFormat:@"馬英九"];
    [array addObject:info];
    [info release];
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"9"];
    info.relationId = [NSString stringWithFormat:@"F000000022"];
    info.relationName = [NSString stringWithFormat:@"蔡英文"];
    [array addObject:info];
    [info release];
    info = [customerRelationInfo new];
    info.clientId = [NSString stringWithFormat:@"F000000001"];
    info.clientName = [NSString stringWithFormat:@"陳正賢"];
    info.relationCode = [NSString stringWithFormat:@"9"];
    info.relationId = [NSString stringWithFormat:@"F000000023"];
    info.relationName = [NSString stringWithFormat:@"蔡英文2"];
    [array addObject:info];
    [info release];
    
    relationArray = [[NSArray alloc] initWithArray:array];
}

@end
