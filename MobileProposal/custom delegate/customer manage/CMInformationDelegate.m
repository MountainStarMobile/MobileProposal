//
//  CMInformationDelegate.m
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "CMInformationDelegate.h"
#import "shareFunction.h"
#import "switchFunction.h"
#import "customerInfo.h"
#import "personalCell.h"

@interface CMInformationDelegate()
{
    NSArray *informationFields;
}

@end

@implementation CMInformationDelegate
@synthesize CMInformation;

- (id)init
{
    self = [super init];
    if (self)
    {
        if (informationFields == nil)
        {
            informationFields = [[NSArray alloc] initWithObjects:
                                 customerNameKey,
                                 customerSexKey,
                                 customerBirthdayKey,
                                 customerCellKey,
                                 customerEmailKey,nil];
        }
    }
    return self;
}

- (void)dealloc
{
    [informationFields release], informationFields = nil;
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return 1;
    return [informationFields count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0)
        return 0;
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section] == 0)
    {
        return 110;
    }
    return 44;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    customerInformationHeaderView *headerView = nil;
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"customerInformationHeaderView" owner:self options:nil];
    for (id currentObj in topLevelObjects)
    {
        if ([currentObj isKindOfClass:[customerInformationHeaderView class]])
        {
            headerView = currentObj;
            break;
        }
    }
    [headerView setDelegate:self];
    if ([aCustomer.facebook length] > 0)
    {
        [headerView.facebookButton setHidden:NO];
    }
    else
    {
        [headerView.facebookButton setHidden:YES];
    }
    if ([aCustomer.googlePlus length] > 0)
    {
        [headerView.googlePlusButton setHidden:NO];
    }
    else
    {
        [headerView.googlePlusButton setHidden:YES];
    }
    if ([aCustomer.facebook length] == 0 && [aCustomer.googlePlus length] == 0)
    {
        [headerView setHidden:YES];
    }
    else
    {
        [headerView setHidden:NO];
    }
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *customerInforCellIdentifier = @"customerInforCellIdentifier";
    static NSString *personalCellIdentifier = @"personalCellIdentifier";
    NSUInteger row = [indexPath row];
    NSUInteger sec = [indexPath section];
    if (sec == 0)
    {
        personalCell *cell = [tableView dequeueReusableCellWithIdentifier:personalCellIdentifier];
        if (cell == nil)
        {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"personalCell" owner:self options:nil];
            for (id currentObj in topLevelObjects)
            {
                if ([currentObj isKindOfClass:[personalCell class]])
                {
                    cell = currentObj;
                    break;
                }
            }
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell.nameLabel setText:aCustomer.name];
        [cell.titleLabel setText:@""];
        [cell.belongLabel setText:@""];
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:customerInforCellIdentifier];
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:customerInforCellIdentifier] autorelease];
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
            [cell.detailTextLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        }
        NSString *key = [informationFields objectAtIndex:row];
        [cell.textLabel setText:[[switchFunction switchFunctionInstance] GetCustomerFieldNameWithInputKey:key]];
        if ([key isEqualToString:customerNameKey])
        {
            [cell.detailTextLabel setText:aCustomer.name];
        }
        else if ([key isEqualToString:customerNickNameKey])
        {
            [cell.detailTextLabel setText:aCustomer.nickName];
        }
        else if ([key isEqualToString:customerCellKey])
        {
            [cell.detailTextLabel setText:[[shareFunction shareFunctionInstance] formatCellPhoneWithCellPhoneNumber:aCustomer.cellPhone]];
        }
        else if ([key isEqualToString:customerEmailKey])
        {
            [cell.detailTextLabel setText:aCustomer.email];
        }
        else if ([key isEqualToString:customerSexKey])
        {
            [cell.detailTextLabel setText:[[switchFunction switchFunctionInstance] GetSexDesc:aCustomer.sex]];
        }
        else if ([key isEqualToString:customerBirthdayKey])
        {
            [cell.detailTextLabel setText:aCustomer.birthDate];
        }    
        return cell;
    }
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
    [delegate CMActionDidSelectWithIndexPath:indexPath andTag:CMTag];
}

- (void)customerInformationActionDidPressFacebookButton
{
    [CMInformation didOpenFacebookUrl];
}

- (void)customerInformationActionDidPressGooglePlusButton
{
    [CMInformation didOpenGooglePlusUrl];
}
@end
