//
//  pratTableViewController.m
//  MobileProposal
//
//  Created by sinss on 13/2/19.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "pratTableViewController.h"
#import "MathFunction.h"
#import "agePrat.h"
#import "ageFactorHeaderView.h"
#import "ageFactorCell.h"

@interface pratTableViewController ()
{
    NSArray *pratArray;
}

- (void)makeFakePrat;

@end

@implementation pratTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        if (pratArray == nil)
        {
            [self makeFakePrat];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [pratArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ageFactorHeaderView *headerView;
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"ageFactorHeaderView" owner:self options:nil];
    for (id currentObj in topLevelObjects)
    {
        if ([currentObj isKindOfClass:[ageFactorHeaderView class]])
        {
            headerView = currentObj;
            break;
        }
    }
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *pratCellIdentifier = @"pratCellIdentifier";
    NSUInteger row = [indexPath row];
    ageFactorCell *cell = [tableView dequeueReusableCellWithIdentifier:pratCellIdentifier];
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"ageFactorCell" owner:self options:nil];
        for (id currentObj in topLevelObjects)
        {
            if ([currentObj isKindOfClass:[ageFactorCell class]])
            {
                cell = currentObj;
                break;
            }
        }
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        if (row % 2 == 1)
        {
            UIView *cellView = [[UIView alloc] init];
            [cellView setBackgroundColor:oddCellBackgroundColor];
            [cell setBackgroundView:cellView];
            [cellView release];
        }
    }
    agePrat *prat = [pratArray objectAtIndex:row];
    [cell.ageLabel setText:[NSString stringWithFormat:@"%@", prat.age]];
    if ([prat.maleFactor doubleValue] == 0)
    {
        [cell.maleLabel setText:@"-"];
    }
    else
    {
        [cell.maleLabel setText:[[MathFunction mathFunctionInstance] displayDefaultNumberWithNumber:prat.femaleFactor andDigit:2]];
    }
    if ([prat.femaleFactor doubleValue] == 0)
    {
        [cell.femaleLabel setText:@"-"];
    }
    else
    {
        [cell.femaleLabel setText:[[MathFunction mathFunctionInstance] displayDefaultNumberWithNumber:prat.femaleFactor andDigit:2]];
    }
    
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (void)makeFakePrat
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 100; i++)
    {
        agePrat *prat = [agePrat new];
        prat.age = [NSNumber numberWithInteger:i];
        prat.maleFactor = [NSNumber numberWithInteger:i * (87.9)];
        prat.femaleFactor = [NSNumber numberWithInteger:i * (91.7)];
        [array addObject:prat];
    }
    pratArray = [[NSArray alloc] initWithArray:array];
}

@end
