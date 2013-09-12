//
//  selectPlanAbbrViewController.m
//  MobileProposal
//
//  Created by sinss on 13/1/22.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "selectPlanAbbrViewController.h"
#import "DatabaseAccess.h"
#import "abbr.h"
#import "systemParamater.h"

@interface selectPlanAbbrViewController ()
{
    NSArray *planAbbrArray;
}
@end

@implementation selectPlanAbbrViewController
@synthesize relation, planAbbr, planCategory, proposalType, projectType, planType, abbrType, delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (planAbbrArray == nil)
    {
        NSArray *tmpAbbr = [[DatabaseAccess databaseAccessInstance] GetAbbrWithProposalType:proposalType andAbbrType:abbrType andPlanType:planType andProjectType:projectType andBrokerCode:[[systemParamater systemParamaterInstance] brokerCode] andPlanCategory:planCategory andRelation:relation];
        planAbbrArray = [[NSArray alloc] initWithArray:tmpAbbr];
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
    [relation release], relation = nil;
    [planAbbrArray release], planAbbrArray = nil;
    [planAbbr release], planAbbr = nil;
    [proposalType release], proposalType = nil;
    [planType release], planType = nil;
    [abbrType release], abbrType = nil;
    [planCategory release], planCategory = nil;
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [planAbbrArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *planAbbrCellIdntifier = @"planAbbrCellIdntifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:planAbbrCellIdntifier];
    NSUInteger row = [indexPath row];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:planAbbrCellIdntifier] autorelease];
    }
    
    abbr *aAbbr = [planAbbrArray objectAtIndex:row];
    if ([aAbbr.planAbbrCode isEqualToString:planAbbr])
    {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    else
    {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    [cell.textLabel setText:aAbbr.planAbbrCode];
    [cell.detailTextLabel setText:aAbbr.planAbbrDesc];
    
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
        abbr *aAbbr = [planAbbrArray objectAtIndex:row];

        [delegate didSelectPlanAbbrWithPlanAbbrCode:aAbbr.planAbbrCode andPlanAbbrDesc:aAbbr.planAbbrDesc];

    }];
}


@end
