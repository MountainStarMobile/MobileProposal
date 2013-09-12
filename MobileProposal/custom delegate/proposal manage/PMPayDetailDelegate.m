//
//  PMPayDetailDelegate.m
//  MobileProposal
//
//  Created by sinss on 13/1/16.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "PMPayDetailDelegate.h"
#import "MathFunction.h"
#import "fundResultCell.h"
#import "lfFundResult.h"

@implementation PMPayDetailDelegate
@synthesize fundResultArray;

- (void)dealloc
{
    [fundResultArray release], fundResultArray = nil;
    [super dealloc];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [fundResultArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *fundResultCellIdentnfier = @"fundResultCellIdentnfier";
    fundResultCell *cell = [tableView dequeueReusableCellWithIdentifier:fundResultCellIdentnfier];
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"fundResultCell" owner:self options:nil];
        for (id currentObj in topLevelObjects)
        {
            if ([currentObj isKindOfClass:[fundResultCell class]])
            {
                cell = currentObj;
                break;
            }
        }
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    NSUInteger row = [indexPath row];
    lfFundResult *fund = [fundResultArray objectAtIndex:row];
    [cell.fundContentLabel setText:fund.fundContent];
    if ([fund.fund1 integerValue] == -1)
    {
        [cell.fundAmountLabel setText:@""];
    }
    else
    {
        [cell.fundAmountLabel setText:[[MathFunction mathFunctionInstance] displayDefaultNumberWithNumber:fund.fund1]];
    }
    if ([fund.fundSeq integerValue] % 10000 == 0)
    {
        [cell setBackgroundColor:[UIColor cyanColor]];
        [cell.fundContentLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
        [cell.fundContentLabel setTextColor:[UIColor brownColor]];
    }
    else
    {
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell.fundContentLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        [cell.fundContentLabel setTextColor:[UIColor darkGrayColor]];
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


@end
