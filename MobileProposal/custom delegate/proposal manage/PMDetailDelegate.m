//
//  PMDetailDelegate.m
//  MobileProposal
//
//  Created by sinss on 13/1/16.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "PMDetailDelegate.h"
#import "switchFunction.h"
#import "MathFunction.h"
#import "proposalPlanCell.h"
#import "savePlanInfo.h"
#import "pldf.h"

@implementation PMDetailDelegate
@synthesize modx;

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [planArray count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return [NSString stringWithFormat:@"遠雄人壽"];
    }
    else if (section == 1)
    {
        return [NSString stringWithFormat:@"法國巴黎人壽"];
    }
    else if (section == 2)
    {
        return [NSString stringWithFormat:@"合庫人壽"];
    }
    return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *detailCellIdeitifier = @"detailCellIdeitifier";
    NSUInteger row = [indexPath row];
    proposalPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:detailCellIdeitifier];
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"proposalPlanCell" owner:self options:nil];
        for (id currentObj in topLevelObjects)
        {
            if ([currentObj isKindOfClass:[proposalPlanCell class]])
            {
                cell = currentObj;
                break;
            }
        }
        if (row % 2 == 1)
        {
            UIView *cellView = [[UIView alloc] init];
            [cellView setBackgroundColor:oddCellBackgroundColor];
            [cell setBackgroundView:cellView];
            [cellView release];
        }
    }
    savePlanInfo *plan = [planArray objectAtIndex:row];
    pldf *aPldf = [pldfArray objectAtIndex:row];
    NSString *detail = [NSString stringWithFormat:@"繳費:%@年期, %@, 保額:%@",
                        aPldf.premiumYearDur,
                        [[switchFunction switchFunctionInstance] GetCoverageDescWithCoverageDur:aPldf.coverageYearDur andCoverageAge:aPldf.coverageYearAge],
                        [[MathFunction mathFunctionInstance] displayDefaultNumberWithNumber:plan.faceAmt]];
    [cell.planDescLabel setText:aPldf.planDesc];
    [cell.detailLabel setText:detail];
    switch (modx)
    {
        case 0:
            [cell.modxPremLabel setText:[[MathFunction mathFunctionInstance] displayDefaultNumberWithNumber:plan.yearPrem]];
            break;
        case 1:
            [cell.modxPremLabel setText:[[MathFunction mathFunctionInstance] displayDefaultNumberWithNumber:plan.halfPrem]];
            break;
        case 2:
            [cell.modxPremLabel setText:[[MathFunction mathFunctionInstance] displayDefaultNumberWithNumber:plan.seasonPrem]];
            break;
        case 3:
            [cell.modxPremLabel setText:[[MathFunction mathFunctionInstance] displayDefaultNumberWithNumber:plan.monPrem]];
            break;
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
