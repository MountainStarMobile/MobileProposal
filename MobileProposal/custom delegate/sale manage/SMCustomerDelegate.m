//
//  SMCustomerDelegate.m
//  MobileProposal
//
//  Created by sinss on 13/3/6.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "SMCustomerDelegate.h"
#import "scheduleInfo.h"

@interface SMCustomerDelegate()

@end

@implementation SMCustomerDelegate

- (id)initWithCustomerAction:(NSArray*)array
{
    self = [super init];
    if (self)
    {
        self.customerArray = array;
    }
    
    return self;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        [self createFakeData];
    }
    return self;
}

- (void)dealloc
{
    [_customerArray release], _customerArray = nil;
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.customerArray count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return [NSString stringWithFormat:@"阿星"];
    return [NSString stringWithFormat:@"阿凌"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SMcustomerCellIdentifier = @"SMcustomerCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SMcustomerCellIdentifier];
    NSUInteger row = [indexPath row];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SMcustomerCellIdentifier] autorelease];
        [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        [cell.detailTextLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    }

    scheduleInfo *info = [self.customerArray objectAtIndex:row];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%@, %@, %@, %@",info.type, info.processDate, info.startTime, info.endTime]];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@, %@",info.clientName, info.conetnt]];

    
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

#pragma mark - create fake data
- (void)createFakeData
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    //1
    scheduleInfo *info = [[scheduleInfo alloc] init];
    info.type = [NSString stringWithFormat:@"1"];
    info.clientId = [NSString stringWithFormat:@"A000000001"];
    info.clientName = [NSString stringWithFormat:@"張星星"];
    info.conetnt = [NSString stringWithFormat:@"送交保單"];
    info.processDate = [NSString stringWithFormat:@"2013/03/04"];
    info.startTime = [NSString stringWithFormat:@"00:00:00"];
    info.endTime = [NSString stringWithFormat:@"10:00:00"];
    info.status = [NSNumber numberWithInteger:0];
    [array addObject:info];
    [info release];
    //2
    info = [[scheduleInfo alloc] init];
    info.type = [NSString stringWithFormat:@"1"];
    info.clientId = [NSString stringWithFormat:@"A000000001"];
    info.clientName = [NSString stringWithFormat:@"張星星"];
    info.conetnt = [NSString stringWithFormat:@"遞送建議書"];
    info.processDate = [NSString stringWithFormat:@"2013/03/05"];
    info.startTime = [NSString stringWithFormat:@"00:00:00"];
    info.endTime = [NSString stringWithFormat:@"10:00:00"];
    info.status = [NSNumber numberWithInteger:0];
    [array addObject:info];
    [info release];
    //3
    info = [[scheduleInfo alloc] init];
    info.type = [NSString stringWithFormat:@"1"];
    info.clientId = [NSString stringWithFormat:@"A000000001"];
    info.clientName = [NSString stringWithFormat:@"李大浩"];
    info.conetnt = [NSString stringWithFormat:@"接觸約訪"];
    info.processDate = [NSString stringWithFormat:@"2013/03/04"];
    info.startTime = [NSString stringWithFormat:@"00:00:00"];
    info.endTime = [NSString stringWithFormat:@"10:00:00"];
    info.status = [NSNumber numberWithInteger:0];
    [array addObject:info];
    [info release];
    //4
    info = [[scheduleInfo alloc] init];
    info.type = [NSString stringWithFormat:@"2"];
    info.clientId = [NSString stringWithFormat:@"A000000001"];
    info.clientName = [NSString stringWithFormat:@"張星星"];
    info.conetnt = [NSString stringWithFormat:@"新人舉績"];
    info.processDate = [NSString stringWithFormat:@"2013/03/06"];
    info.startTime = [NSString stringWithFormat:@"00:00:00"];
    info.endTime = [NSString stringWithFormat:@"10:00:00"];
    info.status = [NSNumber numberWithInteger:0];
    [array addObject:info];
    [info release];
    //5
    info = [[scheduleInfo alloc] init];
    info.type = [NSString stringWithFormat:@"2"];
    info.clientId = [NSString stringWithFormat:@"A000000001"];
    info.clientName = [NSString stringWithFormat:@"張星星"];
    info.conetnt = [NSString stringWithFormat:@"燭光晚餐"];
    info.processDate = [NSString stringWithFormat:@"2013/03/09"];
    info.startTime = [NSString stringWithFormat:@"00:00:00"];
    info.endTime = [NSString stringWithFormat:@"10:00:00"];
    info.status = [NSNumber numberWithInteger:0];
    [array addObject:info];
    [info release];
    //6
    info = [[scheduleInfo alloc] init];
    info.type = [NSString stringWithFormat:@"3"];
    info.clientId = [NSString stringWithFormat:@"A000000001"];
    info.clientName = [NSString stringWithFormat:@"許文強"];
    info.conetnt = [NSString stringWithFormat:@"增員面談"];
    info.processDate = [NSString stringWithFormat:@"2013/03/05"];
    info.startTime = [NSString stringWithFormat:@"00:00:00"];
    info.endTime = [NSString stringWithFormat:@"10:00:00"];
    info.status = [NSNumber numberWithInteger:0];
    [array addObject:info];
    [info release];
    //7
    info = [[scheduleInfo alloc] init];
    info.type = [NSString stringWithFormat:@"3"];
    info.clientId = [NSString stringWithFormat:@"A000000001"];
    info.clientName = [NSString stringWithFormat:@"張星星"];
    info.conetnt = [NSString stringWithFormat:@"申辦手機"];
    info.processDate = [NSString stringWithFormat:@"2013/03/09"];
    info.startTime = [NSString stringWithFormat:@"00:00:00"];
    info.endTime = [NSString stringWithFormat:@"10:00:00"];
    info.status = [NSNumber numberWithInteger:0];
    [array addObject:info];
    [info release];
    //8
    info = [[scheduleInfo alloc] init];
    info.type = [NSString stringWithFormat:@"4"];
    info.clientId = [NSString stringWithFormat:@"A000000001"];
    info.clientName = [NSString stringWithFormat:@"張星星"];
    info.conetnt = [NSString stringWithFormat:@"簽要保書"];
    info.processDate = [NSString stringWithFormat:@"2013/03/07"];
    info.startTime = [NSString stringWithFormat:@"00:00:00"];
    info.endTime = [NSString stringWithFormat:@"10:00:00"];
    info.status = [NSNumber numberWithInteger:0];
    [array addObject:info];
    [info release];
    //9
    info = [[scheduleInfo alloc] init];
    info.type = [NSString stringWithFormat:@"4"];
    info.clientId = [NSString stringWithFormat:@"A000000001"];
    info.clientName = [NSString stringWithFormat:@"張星星"];
    info.conetnt = [NSString stringWithFormat:@"送交保單"];
    info.processDate = [NSString stringWithFormat:@"2013/03/10"];
    info.startTime = [NSString stringWithFormat:@"00:00:00"];
    info.endTime = [NSString stringWithFormat:@"10:00:00"];
    info.status = [NSNumber numberWithInteger:0];
    [array addObject:info];
    [info release];
    self.customerArray = [NSArray arrayWithArray:array];
}
@end
