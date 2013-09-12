//
//  MSMasterViewController.m
//  MSNavigationPaneViewController
//
//  Created by Eric Horacek on 11/20/12.
//  Copyright (c) 2012 Monospace Ltd. All rights reserved.
//
//  This code is distributed under the terms and conditions of the MIT license.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
#import "MSMasterViewController.h"
#import "customerListTableViewController.h"
#import "scheduleListTableViewController.h"
#import "scheduleViewController.h"
#import "proposalListTableViewController.h"
#import "saleListTableViewController.h"
#import "serviceTelephoneViewController.h"
#import "settingTableViewController.h"
#import "personalCell.h"
#import "systemParamater.h"

NSString * const MSMasterViewControllerCellReuseIdentifier = @"MSMasterViewControllerCellReuseIdentifier";

typedef NS_ENUM(NSUInteger, MSMasterViewControllerTableViewSectionType) {
    MSMasterViewControllerTableViewSectionTypeColors,
    MSMasterViewControllerTableViewSectionTypeAbout,
    MSMasterViewControllerTableViewSectionTypeCount,
};

@interface MSMasterViewController ()

@property (nonatomic, strong) NSDictionary *paneViewControllerTitles;
@property (nonatomic, strong) NSDictionary *paneViewControllerTintColor;
@property (nonatomic, strong) NSDictionary *paneViewControllerClasses;
@property (nonatomic, strong) NSDictionary *personalTitles;
@property (nonatomic, strong) NSDictionary *personalTiniColor;
@property (nonatomic, strong) NSDictionary *personalClasses;
@property (nonatomic, strong) NSArray *tableViewSectionBreaks;

@end

@implementation MSMasterViewController

#pragma mark - UIViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.paneViewControllerType = NSUIntegerMax;
        self.paneViewControllerTitles = @{
            @(AmongFunctionTypeViewTypeCustomer) : @"客戶管理",
            @(AmongFunctionTypeViewTypeSchedule) : @"行程管理",
            @(AmongFunctionTypeViewTypeProposal) : @"提案管理",
            @(AmongFunctionTypeViewTypeSale) : @"業務管理",
            @(AmongFunctionTypeViewTypeServiceTel) : @"免付費服務電話",
            @(AmongFunctionTypeViewTypeSetting) : @"關於我們",
        };
        self.paneViewControllerClasses = @{
            @(AmongFunctionTypeViewTypeCustomer) : customerListTableViewController.class,
            @(AmongFunctionTypeViewTypeSchedule) : scheduleViewController.class,
            @(AmongFunctionTypeViewTypeProposal) : proposalListTableViewController.class,
            @(AmongFunctionTypeViewTypeSale) : saleListTableViewController.class,
            @(AmongFunctionTypeViewTypeServiceTel) : serviceTelephoneViewController.class,
            @(AmongFunctionTypeViewTypeSetting) : settingTableViewController.class,
        };
        self.paneViewControllerTintColor = @{
            @(AmongFunctionTypeViewTypeCustomer) : [UIColor colorWithRed:0.502 green:0.000 blue:0.000 alpha:1.000],
            @(AmongFunctionTypeViewTypeSchedule) : [UIColor colorWithRed:0.502 green:0.000 blue:0.000 alpha:1.000],
            @(AmongFunctionTypeViewTypeProposal) : [UIColor colorWithRed:0.000 green:0.251 blue:0.502 alpha:1.000],
            @(AmongFunctionTypeViewTypeSale) : [UIColor colorWithRed:0.251 green:0.502 blue:0.000 alpha:1.000],
            @(AmongFunctionTypeViewTypeServiceTel) : [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1],
            @(AmongFunctionTypeViewTypeSetting) : [UIColor brownColor],
        };
        self.personalTitles = @{
            @(AmongPersonalViewTypePersonal) : @"帳號",
            @(AmongPersonalViewTypePersonalModify) : @"個人資料",
        };
        self.personalClasses = @{
            @(AmongPersonalViewTypePersonal) : customerListTableViewController.class,
            @(AmongPersonalViewTypePersonalModify) : customerListTableViewController.class,
        };
        self.personalTiniColor = @{
            @(AmongPersonalViewTypePersonal) : [UIColor darkGrayColor],
            @(AmongPersonalViewTypePersonalModify) : [UIColor darkGrayColor],
            };
        self.tableViewSectionBreaks = @[
            @(MSPaneViewControllerTypeMonospace),
            @(MSPaneViewControllerTypeCount)
        ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    UIImageView *sbg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebarbg"]];
    [sbg setContentMode:UIViewContentModeScaleAspectFill];
    [sbg setFrame:self.tableView.bounds];
    [self.tableView setBackgroundView:sbg];
    self.view.backgroundColor = [UIColor clearColor];
}

#pragma mark - MSMasterViewController

#pragma mark section0 
- (MSPaneViewControllerType)panelViewControllerTypeForIndexPath:(NSIndexPath*)indexPath
{
    AmongPersonalViewType paneViewControllerType;
    paneViewControllerType = indexPath.row;
    
    NSAssert(paneViewControllerType < AmongProposalViewTypeCount, @"Invalid Index Path");
    return paneViewControllerType;
}

#pragma mark section1

- (MSPaneViewControllerType)paneViewControllerTypeForIndexPath2:(NSIndexPath *)indexPath
{
    AmongFunctionTypeViewType paneViewControllerType;
    
    paneViewControllerType = indexPath.row;

    NSAssert(paneViewControllerType < AmongFunctionTypeViewTypeCount, @"Invalid Index Path");
    return paneViewControllerType;
}

#pragma mrak Section0 transition
- (void)transitionToViewController:(AmongFunctionTypeViewType)paneViewControllerType
{
    BOOL animateTransition = self.navigationPaneViewController.paneViewController != nil;
    
    Class paneViewControllerClass = self.personalClasses[@(paneViewControllerType)];
    NSParameterAssert([paneViewControllerClass isSubclassOfClass:UIViewController.class]);
    UIViewController *paneViewController = (UIViewController *)[[paneViewControllerClass alloc] init];
    paneViewController.navigationItem.title = self.personalTitles[@(paneViewControllerType)];
    paneViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MSBarButtonIconNavigationPane.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(navigationPaneBarButtonItemTapped:)];
    
    UINavigationController *paneNavigationViewController = [[UINavigationController alloc] initWithRootViewController:paneViewController];
    paneNavigationViewController.navigationBar.tintColor = self.personalTiniColor[@(paneViewControllerType)];
    paneNavigationViewController.toolbar.tintColor = self.personalTiniColor[@(paneViewControllerType)];
    
    [self.navigationPaneViewController setPaneViewController:paneNavigationViewController animated:animateTransition completion:nil];
    
    self.paneViewControllerType = paneViewControllerType;
}

#pragma mark Section1 transition
- (void)transitionToViewController2:(AmongFunctionTypeViewType)paneViewControllerType
{
    if (paneViewControllerType == self.paneViewControllerType) {
        [self.navigationPaneViewController setPaneState:MSNavigationPaneStateClosed animated:YES];
        return;
    }
    
    BOOL animateTransition = self.navigationPaneViewController.paneViewController != nil;
    
    Class paneViewControllerClass = self.paneViewControllerClasses[@(paneViewControllerType)];
    NSParameterAssert([paneViewControllerClass isSubclassOfClass:UIViewController.class]);
    UIViewController *paneViewController = (UIViewController *)[[paneViewControllerClass alloc] init];
    paneViewController.navigationItem.title = self.paneViewControllerTitles[@(paneViewControllerType)];
    paneViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MSBarButtonIconNavigationPane.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(navigationPaneBarButtonItemTapped:)];
    
    UINavigationController *paneNavigationViewController = [[UINavigationController alloc] initWithRootViewController:paneViewController];
    paneNavigationViewController.navigationBar.tintColor = self.paneViewControllerTintColor[@(paneViewControllerType)];
    paneNavigationViewController.toolbar.tintColor = self.paneViewControllerTintColor[@(paneViewControllerType)];
    
    [self.navigationPaneViewController setPaneViewController:paneNavigationViewController animated:animateTransition completion:nil];
    
    self.paneViewControllerType = paneViewControllerType;
}

- (void)navigationPaneBarButtonItemTapped:(id)sender;
{
    [self.navigationPaneViewController setPaneState:MSNavigationPaneStateOpen animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return [self.personalTitles count];
    return [self.paneViewControllerTitles count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headerView_bg3.png"]];
    [imageview setFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,
                                                               self.view.frame.size.width,
                                                               20)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
    [label setTextColor:[UIColor whiteColor]];
    if (section == 0)
    {
        [label setText:@"帳號"];
    }
    else
    {
        [label setText:@"功能列表"];
    }
    [imageview addSubview:label];
    return imageview;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger sec = [indexPath section];
    NSUInteger row = [indexPath row];
    if (sec == 0)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MSMasterViewControllerCellReuseIdentifier];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MSMasterViewControllerCellReuseIdentifier];
            UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebarcell"]];
            [bg setFrame:CGRectMake(0, 0, 199.5, 42.5)];
            [cell setBackgroundView:bg];
            [cell.textLabel setTextColor:[UIColor lightGrayColor]];
            [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        }
        if (row == 0)
        {
            cell.textLabel.text = [NSString stringWithFormat:@"帳號"];
        }
        else if (row == 1)
        {
            cell.textLabel.text = [NSString stringWithFormat:@"個人資料"];
        }
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MSMasterViewControllerCellReuseIdentifier];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MSMasterViewControllerCellReuseIdentifier];
            UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebarcell"]];
            [bg setFrame:CGRectMake(0, 0, 199.5, 42.5)];
            [cell setBackgroundView:bg];
            UIImage *img = [UIImage imageNamed:@"item01.png"];
            [cell.imageView setImage:img];
            [cell.textLabel setTextColor:[UIColor lightGrayColor]];
            [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        }
        cell.textLabel.text = self.paneViewControllerTitles[@([self paneViewControllerTypeForIndexPath2:indexPath])];
        
        return cell;
    }
    return nil;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger sec = [indexPath section];
    if (sec == 0)
    {
        [self transitionToViewController:[self panelViewControllerTypeForIndexPath:indexPath]];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    else if (sec == 1)
    {
        [self transitionToViewController2:[self paneViewControllerTypeForIndexPath2:indexPath]];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

@end
