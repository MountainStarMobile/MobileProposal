//
//  serviceTelephoneViewController.m
//  MobileProposal
//
//  Created by sinss on 13/1/16.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "serviceTelephoneViewController.h"
#import "HMSegmentedControl.h"
#import "DatabaseAccess.h"
#import "serviceTel.h"
#import "serviceTelCell.h"

@interface serviceTelephoneViewController ()
{
    NSArray *serviceTelArray;
    NSMutableArray *fetchServiceTelArray;
}

- (void)fetchServiceTelArrayWithTag:(NSInteger)tag;
- (void)showAlertViewWithMessage:(NSString*)message andTitle:(NSString*)title;

@end

@implementation serviceTelephoneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"免付費服務電話", @"");
        if (serviceTelArray == nil)
        {
            serviceTelArray = [[NSArray alloc] initWithArray:[[DatabaseAccess databaseAccessInstance] GetServiceServiceData]];
        }
        if (fetchServiceTelArray == nil)
        {
            fetchServiceTelArray = [[NSMutableArray alloc] initWithCapacity:0];
        }
        [self fetchServiceTelArrayWithTag:0];
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
    [segmentedControl setSectionTitles:@[@"產險公司", @"壽險公司", @"公家單位"]];
    [segmentedControl setSelectionIndicatorHeight:4.0f];
    [segmentedControl setBackgroundColor:[UIColor clearColor]];
    [segmentedControl setTextColor:[UIColor whiteColor]];
    [segmentedControl setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [segmentedControl setSelectionIndicatorColor:[UIColor redColor]];
    [segmentedControl setSelectionIndicatorMode:HMSelectionIndicatorFillsSegment];
    [segmentedControl setSegmentEdgeInset:UIEdgeInsetsMake(0, 6, 0, 6)];
    [segmentedControl setTag:4];
    [aTableView setTableHeaderView:segmentedControl];
    
    UIView *emptyView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    [aTableView setTableFooterView:emptyView];
    
    [aTableView setDelegate:self];
    [aTableView setDataSource:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [serviceTelArray release], serviceTelArray = nil;
    [fetchServiceTelArray release], fetchServiceTelArray = nil;
    [super dealloc];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [fetchServiceTelArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *serviceCellIdentifier = @"serviceCellIdentifier";
    NSUInteger row = [indexPath row];
    serviceTelCell *cell = [tableView dequeueReusableCellWithIdentifier:serviceCellIdentifier];
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"serviceTelCell" owner:self options:nil];
        for (id currentObj in topLevelObjects)
        {
            if ([currentObj isKindOfClass:[serviceTelCell class]])
            {
                cell = currentObj;
                break;
            }
        }
        [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
        if (row % 2 == 1)
        {
            UIView *cellView = [[UIView alloc] init];
            [cellView setBackgroundColor:oddCellBackgroundColor];
            [cell setBackgroundView:cellView];
            [cellView release];
        }
    }
    serviceTel *info = [fetchServiceTelArray objectAtIndex:row];
    [cell.companyNameLabel setText:info.companyName];
    [cell.phoneLabel setText:info.telphone];
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [aTableView deselectRowAtIndexPath:indexPath animated:YES];
    serviceTel *info = [fetchServiceTelArray objectAtIndex:[indexPath row]];
    [self showAlertViewWithMessage:info.telphone andTitle:@"確定要撥打"];
}

#pragma mark - HMSegment Action
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl
{
	NSLog(@"Selected index %i (via UIControlEventValueChanged)", segmentedControl.selectedSegmentIndex);
    
    [self fetchServiceTelArrayWithTag:segmentedControl.selectedSegmentIndex];
}

#pragma mark - UIAlertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        NSString *phone = [NSString stringWithFormat:@"tel:%@",[alertView message]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phone]];
    }
}

#pragma mark - user define function
- (void)fetchServiceTelArrayWithTag:(NSInteger)tag
{
    NSString *para = nil;
    switch (tag)
    {
        case 0:
            para = [NSString stringWithFormat:@"type='1'"];
            break;
        case 1:
            para = [NSString stringWithFormat:@"type='2'"];
            break;
        case 2:
            para = [NSString stringWithFormat:@"type='0'"];
            break;
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:para];
    NSArray *tmpArray = [serviceTelArray filteredArrayUsingPredicate:predicate];
    [fetchServiceTelArray removeAllObjects];
    [fetchServiceTelArray addObjectsFromArray:tmpArray];
    [aTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)showAlertViewWithMessage:(NSString*)message andTitle:(NSString*)title
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"撥打", nil];
    [alert show];
    [alert release];
}

@end
