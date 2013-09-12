//
//  CMRelationLogDelegate.m
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "CMRelationLogDelegate.h"
#import "switchFunction.h"

#import "customerRelationInfo.h"

@interface CMRelationLogDelegate()
{
    NSArray *relationArray;
    NSArray *groupArray;
    NSMutableDictionary *relationDict;
}

- (void)createRelationDict;

@end

@implementation CMRelationLogDelegate
@synthesize cmRelationDelegate;

- (id)initWithRelationArray:(NSArray*)array
{
    self = [super init];
    if (self)
    {
        groupArray = [[NSArray alloc] initWithObjects:
                      CMRelationParentKey,
                      CMRelationChildrenKey,
                      CMRelationManagerKey,
                      CMRelationSubordinatorKey,
                      CMRelationBrotherKey,
                      CMRelationSisterKey,
                      CMRelationFriendKey,
                      CMRelationCoupleKey,
                      CMRelationLoverKey,
                      CMRelationColleagueKey,
                      nil];
        relationArray = [[NSArray alloc] initWithArray:array];
        [self createRelationDict];
    }
    return self;
}

- (void)dealloc
{
    cmRelationDelegate = nil;
    [relationDict release], relationDict = nil;
    [relationArray release], relationArray = nil;
    [groupArray release], groupArray = nil;
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [groupArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    NSString *key = [groupArray objectAtIndex:section];
    NSArray *tmpArray = [relationDict valueForKey:key];
    if ([tmpArray count] == 0)
    {
        return 0;
    }
    return 25;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *imageview = [[UIImageView alloc] initWithImage:nil];
    [imageview setFrame:CGRectMake(5, 0, 320, 20)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0,
                                                               320,
                                                               20)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [label setTextColor:[UIColor blackColor]];
    [label setShadowColor:[UIColor lightTextColor]];
    NSString *key = [groupArray objectAtIndex:section];
    [label setText:[[switchFunction switchFunctionInstance] GetCustomerRelationNameWithKey:key]];
    [imageview addSubview:label];
    return imageview;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *relationCellIdentifier = @"relationCellIdentifier";
    NSUInteger sec = [indexPath section];
    /*
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:relationCellIdentifier];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:relationCellIdentifier] autorelease];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    */
    customerRelationCell *cell = [tableView dequeueReusableCellWithIdentifier:relationCellIdentifier];
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"customerRelationCell" owner:self options:nil];
        for (id currentObj in topLevelObjects)
        {
            if ([currentObj isKindOfClass:[customerRelationCell class]])
            {
                cell = currentObj;
                break;
            }
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setDelegate:self];
    }
    NSString *key = [groupArray objectAtIndex:sec];
    NSArray *tmpArray = [relationDict valueForKey:key];
    [cell setAIndexPath:indexPath];
    [cell setRelationArray:tmpArray];
    [cell createRelationButton];
    
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

#pragma mark - relationCell Action
- (void)didClickRelationButtonWithCell:(NSIndexPath*)indexPath andButtonTag:(NSInteger)tag
{
    NSString *key = [groupArray objectAtIndex:[indexPath section]];
    NSArray *tmpArray = [relationDict valueForKey:key];
    customerRelationInfo *relationInfo = [tmpArray objectAtIndex:tag];
    [cmRelationDelegate didSelectRelationCellWithClientId:relationInfo.relationId];
}

- (void)createRelationDict
{
    NSDictionary *relationKeyDict = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"relationKey"];
    relationDict = [[NSMutableDictionary alloc] initWithCapacity:0];
    for (NSString *relationKey in groupArray)
    {
        NSNumber *code = [relationKeyDict valueForKey:relationKey];
        NSString *para = [NSString stringWithFormat:@"relationCode='%@'",code];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:para];
        NSArray *tmpArray = [relationArray filteredArrayUsingPredicate:predicate];
        [relationDict setValue:tmpArray forKey:relationKey];
    }
    NSLog(@"%@",relationDict);
}

@end
