//
//  selectPlanAid2ViewController.m
//  MobileProposal
//
//  Created by sinss on 13/1/23.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "selectPlanAid2ViewController.h"
#import "DatabaseAccess.h"

@interface selectPlanAid2ViewController ()
{
    NSArray *planAidArray;
}

@end

@implementation selectPlanAid2ViewController
@synthesize delegate, planCodeOrder, planAbbr, periodOrder;

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
        NSArray *tmpArray = [[DatabaseAccess databaseAccessInstance] getPlanAidWithPlanAbbr:planAbbr andPeriod:periodOrder];
        planAidArray = [[NSArray alloc] initWithArray:tmpArray];
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
    [planCodeOrder release], planCodeOrder = nil;
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
    static NSString *planAidCellIdentifier = @"planAid2CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:planAidCellIdentifier];
    NSUInteger row = [indexPath row];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:planAidCellIdentifier] autorelease];
    }
    
    planAid *aid = [planAidArray objectAtIndex:row];
    if ([aid.planCodeOrder isEqualToNumber:planCodeOrder] && [aid.periodOrder isEqualToNumber:periodOrder])
    {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    else
    {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    [cell.textLabel setText:aid.planCodeDesc];
    
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
        [delegate didSelectPlanCodeOrder:aid.planCodeOrder andOrderDesc:aid.planCodeDesc];
    }];
}


@end
