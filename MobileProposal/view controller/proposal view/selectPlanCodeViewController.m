//
//  selectPlanCodeViewController.m
//  MobileProposal
//
//  Created by sinss on 13/1/28.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "selectPlanCodeViewController.h"
#import "DatabaseAccess.h"

@interface selectPlanCodeViewController ()
{
    NSMutableString *searchKey;
    NSArray *planAidArray;
    NSMutableArray *fetchPlanAidArray;
}

- (void)createBarItem;
- (void)fetchSearchResult;

@end

@implementation selectPlanCodeViewController
@synthesize delegate, relation, aCustomer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        if (searchKey == nil)
        {
            searchKey = [[NSMutableString alloc] initWithCapacity:0];
        }
        if (fetchPlanAidArray == nil)
        {
            fetchPlanAidArray = [[NSMutableArray alloc] initWithCapacity:0];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (planAidArray == nil)
    {
        NSArray *tmpArray = [[DatabaseAccess databaseAccessInstance] GetAllPlanAidDataWithRelation:relation andAge:aCustomer.age];
        planAidArray = [[NSArray alloc] initWithArray:tmpArray];
    }
    [self createBarItem];
    [self fetchSearchResult];
    UIView *emptyView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    [aTableView setTableFooterView:emptyView];
    [aTableView setDelegate:self];
    [aTableView setDataSource:self];
    [searchBar setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    delegate = nil;
    [aCustomer release], aCustomer = nil;
    [relation release], relation = nil;
    [searchBar release], searchBar = nil;
    [aTableView release], aTableView = nil;
    [searchKey release], searchKey = nil;
    [planAidArray release], planAidArray = nil;
    [fetchPlanAidArray release], fetchPlanAidArray = nil;
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [fetchPlanAidArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *planCodeCellIdentifier = @"planCodeCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:planCodeCellIdentifier];
    NSUInteger row = [indexPath row];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:planCodeCellIdentifier] autorelease];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
    }
    
    planAid *aid = [fetchPlanAidArray objectAtIndex:row];

    NSString *detailStr = [NSString stringWithFormat:@"%@, %@, %@ (公司:%@, 通路:%@)", aid.planAbbrCode, aid.planCodeDesc, aid.periodDesc, aid.companyCode, aid.brokerCode];
    [cell.detailTextLabel setText:detailStr];
    [cell.textLabel setText:aid.planAbbrDesc];
    
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
    planAid *aid = [fetchPlanAidArray objectAtIndex:[indexPath row]];

    [delegate didSelectPlanAidRecord:aid];
    [self dismissView:nil];
}

#pragma mark - UISearchBar delegate
- (void)searchBar:(UISearchBar *)asearchBar textDidChange:(NSString *)searchText
{
    [searchKey setString:searchText];
    [self fetchSearchResult];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)asearchBar
{
    [asearchBar resignFirstResponder];
}

#pragma mark - user definf function
- (void)createBarItem
{
    UIBarButtonItem *dismissItem = [[UIBarButtonItem alloc] initWithTitle:@"離開" style:UIBarButtonItemStylePlain target:self action:@selector(dismissView:)];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObject:dismissItem];
    [dismissItem release];
}

- (void)fetchSearchResult
{
    [fetchPlanAidArray removeAllObjects];
    NSString *para = nil;
    if ([searchKey length] == 0)
    {
        para = [NSString stringWithFormat:@"1=1"];
    }
    else
    {
        para = [NSString stringWithFormat:@"periodDesc contains '%@' or planCodeDesc contains '%@' or planAbbrDesc contains '%@' or IPlanCode contains[c] '%@' or SPlanCode contains[c] '%@' or CPlanCode contains[c] '%@'",searchKey, searchKey, searchKey, searchKey, searchKey, searchKey];
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:para];
    NSArray *tmpArray = [planAidArray filteredArrayUsingPredicate:predicate];
    [fetchPlanAidArray addObjectsFromArray:tmpArray];
    [aTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)dismissView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
    
    }];
}

@end
