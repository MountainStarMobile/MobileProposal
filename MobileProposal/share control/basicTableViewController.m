//
//  basicTableViewController.m
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "basicTableViewController.h"

@interface basicTableViewController ()
{
    UISearchBar *aSearchBar;
    BOOL showLogin;
}

- (void)createSearchBar;
- (void)checkLoginStatus;

@end

@implementation basicTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        searchKey = [[NSMutableString alloc] initWithCapacity:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *emptyView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    [self.tableView setTableFooterView:emptyView];
    [self createSearchBar];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //[self checkLoginStatus];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView setContentOffset:CGPointMake(0,40) animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [searchKey release], searchKey = nil;
    [aSearchBar release], aSearchBar = nil;
    [super dealloc];
}

- (void)createSearchBar
{
    aSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [aSearchBar setPlaceholder:[NSString stringWithFormat:@"輸入搜尋關鍵字(姓名、性別、生日...等)"]];
    [aSearchBar setDelegate:self];
    [self.tableView setTableHeaderView:aSearchBar];
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    UIBarButtonItem *disposeItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(disposeItemPress)];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:flexItem, disposeItem, nil]];
    [aSearchBar setInputAccessoryView:toolBar];
    [toolBar release];
}

- (void)disposeItemPress
{
    [aSearchBar resignFirstResponder];
}

- (void)fetchSearchResult
{
    
}

- (void)checkLoginStatus
{
    NSString *account = [[NSUserDefaults standardUserDefaults] valueForKey:key_agentCode];
    NSString *password = [[NSUserDefaults standardUserDefaults] valueForKey:key_password];
    if ([account length] == 0 || [password length] == 0)
    {
        loginTableViewController *loginView = [[loginTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginView];
        [nav setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self presentViewController:nav animated:YES completion:nil];
        [loginView release];
        [nav release];
    }
}

#pragma mark - UISearchBar delegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

@end