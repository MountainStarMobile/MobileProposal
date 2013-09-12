//
//  selectPlanAidViewController.m
//  MobileProposal
//
//  Created by sinss on 13/1/22.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "selectPlanAidViewController.h"
#import "DatabaseAccess.h"
#import "planAid.h"

@interface selectPlanAidViewController ()
{
    NSArray *planAidArray;
}
@end

@implementation selectPlanAidViewController
@synthesize planAbbr, periodOrder, planCodeOrder, delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (planAidArray == nil)
    {
        NSArray *aidArray = [[DatabaseAccess databaseAccessInstance] GetPlanAidWithPlanAbbrCode:planAbbr];
        planAidArray = [[NSArray alloc] initWithArray:aidArray];
    }
    UIView *emptyView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    [aTableView setTableFooterView:emptyView];
    [aTableView setDelegate:self];
    [aTableView setDataSource:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    delegate = nil;
    [aTableView release], aTableView = nil;
    [periodOrder release], periodOrder = nil;
    [planCodeOrder release], planCodeOrder = nil;
    [planAidArray release], planAidArray = nil;
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [planAidArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *planAidCellIdentifier = @"planAidCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:planAidCellIdentifier];
    NSUInteger row = [indexPath row];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:planAidCellIdentifier] autorelease];
    }
    
    planAid *aid = [planAidArray objectAtIndex:row];
    if ([aid.periodOrder isEqualToNumber:periodOrder] && [aid.planCodeOrder isEqualToNumber:planCodeOrder])
    {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    else
    {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    [cell.textLabel setText:aid.periodDesc];
    [cell.detailTextLabel setText:aid.planCodeDesc];
    
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
    [self dismissViewControllerAnimated:YES completion:^{
        NSUInteger row = [indexPath row];
        planAid *aid = [planAidArray objectAtIndex:row];
        [delegate didSelectPlanOrderWithPeriod:aid.periodOrder andPeriodDesc:aid.periodDesc andPlanCodeOrder:aid.planCodeOrder andPlanCodeDesc:aid.planCodeDesc andIPlanCode:aid.IPlanCode andSplanCode:aid.SPlanCode andCPlanCode:aid.CPlanCode];
    }];
}
@end
