//
//  PMProtectionContentDelegate.m
//  MobileProposal
//
//  Created by sinss on 13/1/16.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "PMProtectionContentDelegate.h"
#import "planIntroResult.h"
#import "textViewCell.h"

@implementation PMProtectionContentDelegate
@synthesize planIntroArray;

- (void)dealloc
{
    [planIntroArray release], planIntroArray = nil;
    [super dealloc];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [planIntroArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    planIntroResult *intro = [planIntroArray objectAtIndex:row];
    NSUInteger lines = [intro.introduction length] / lineMaxWords;
    if ([intro.introduction length] % lineMaxWords > 0 && lines > 0)
    {
        lines ++;
    }
    return 30 + lineHeightUnit * lines;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *planIntroCellIdentifier = @"planIntroCellIdentifier";
    textViewCell *cell = [tableView dequeueReusableCellWithIdentifier:planIntroCellIdentifier];
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"textViewCell" owner:self options:nil];
        for (id currentObj in topLevelObjects)
        {
            if ([currentObj isKindOfClass:[textViewCell class]])
            {
                cell = currentObj;
                break;
            }
        }
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell.aTextView setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    }
    planIntroResult *intro = [planIntroArray objectAtIndex:[indexPath row]];
    
    NSUInteger lines = [intro.introduction length] / lineMaxWords;
    if ([intro.introduction length] % lineMaxWords > 0 && lines > 0)
    {
        lines ++;
    }
    if ([intro.seq integerValue] == 0)
    {
        [cell setBackgroundColor:[UIColor cyanColor]];
        [cell.aTextView setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
        [cell.aTextView setTextColor:[UIColor brownColor]];
    }
    else
    {
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell.aTextView setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        [cell.aTextView setTextColor:[UIColor darkGrayColor]];
    }
    [cell.aTextView setFrame:CGRectMake(0, 0, 320, 30 + (lineHeightUnit * lines))];
    [cell.aTextView setText:intro.introduction];
    
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
