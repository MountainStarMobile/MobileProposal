//
//  loginTableViewController.m
//  MobileProposal
//
//  Created by sinss on 13/3/4.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "loginTableViewController.h"
#import "inputFieldCell.h"
#import "customButtonCell.h"
#import "loginProcess.h"

typedef NS_ENUM(NSUInteger, loginButtonTag) {
    loginButtonTagLogin,
    loginButtonTagClear,
};


@interface loginTableViewController () <UITextFieldDelegate, customButtonDelegate, loginStatusDelegate>
{
    NSArray *loginFields;
    NSArray *buttonFields;
    NSArray *placeHolderFields;
}

@property (nonatomic, retain) NSString *accountId;
@property (nonatomic, retain) NSString *password;

- (void)createBarItem;
- (void)dismissView;

@end

@implementation loginTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        if (loginFields == nil)
        {
            loginFields = [[NSArray alloc] initWithObjects:loginAccountKey,loginPasswordKey, nil];
        }
        if (placeHolderFields == nil)
        {
            placeHolderFields = [[NSArray alloc] initWithObjects:@"輸入帳號(業務同仁id)",@"輸入密碼(業務同仁密碼)", nil];
        }
        if (buttonFields == nil)
        {
            buttonFields = [[NSArray alloc] initWithObjects:@"登入", @"清除", nil];
        }
        if (self.accountId == nil)
        {
            self.accountId = [NSString stringWithFormat:@""];
        }
        if (self.password == nil)
        {
            self.password = [NSString stringWithFormat:@""];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [self createBarItem];
    UIImageView *imageview = [[UIImageView alloc] initWithImage:whiteBgImage];
    [self.tableView setBackgroundView:imageview];
    [self.tableView setSeparatorColor:[UIColor lightGrayColor]];
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

- (void)dealloc
{
    [loginFields release], loginFields = nil;
    [placeHolderFields release], placeHolderFields = nil;
    [buttonFields release], buttonFields = nil;
    [_accountId release], _accountId = nil;
    [_password release], _password = nil;
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return [loginFields count];
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *loginCellIdentifier = @"loginCellIdentifier";
    static NSString *loginButtonCellIdentifier = @"loginButtonCellIdentifier";
    NSInteger sec = [indexPath section];
    NSUInteger row = [indexPath row];
    if (sec == 0)
    {
        inputFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:loginCellIdentifier];
        if (cell == nil)
        {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"inputFieldCell" owner:self options:nil];
            for (id currentObj in topLevelObjects)
            {
                if ([currentObj isKindOfClass:[inputFieldCell class]])
                {
                    cell = currentObj;
                    break;
                }
            }
            [cell.inputField setTag:row];
            [cell.inputField setDelegate:self];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        }
        [cell.inputField setPlaceholder:[placeHolderFields objectAtIndex:row]];
        
        return cell;
    }
    else
    {
        customButtonCell *cell = [self.tableView dequeueReusableCellWithIdentifier:loginButtonCellIdentifier];
        if (cell == nil)
        {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"customButtonCell" owner:self options:nil];
            for (id currentObj in topLevelObjects)
            {
                if ([currentObj isKindOfClass:[customButtonCell class]])
                {
                    cell = currentObj;
                    break;
                }
            }
            [cell setDelegate:self];
        }
        if (sec == 1)
        {
            [cell.cellButton setTag:0];
            [cell.cellButton setTitle:[NSString stringWithFormat:@"登入"] forState:UIControlStateNormal];
        }
        else if (sec == 2)
        {
            [cell.cellButton setTag:1];
            [cell.cellButton setTitle:[NSString stringWithFormat:@"清除"] forState:UIControlStateNormal];
        }
        
        return  cell;
    }
    return nil;
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

#pragma mark - UITextField delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSInteger tag = [textField tag];
    if (tag == 0)
    {
        self.accountId = [self.accountId stringByReplacingCharactersInRange:range withString:string];
    }
    else if (tag == 1)
    {
        self.password = [self.password stringByReplacingCharactersInRange:range withString:string];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - customButtonDelegate
- (void)didSendButtonPress:(NSInteger)buttonTag
{
    if (buttonTag == loginButtonTagLogin)
    {
        loginProcess *loginObject = [[loginProcess alloc] initWithAccount:self.accountId andPassword:self.password];
        [loginObject setDelegate:self];
        [loginObject startLoginProcess];
    }
    else if (buttonTag == loginButtonTagClear)
    {
        
    }
}

#pragma mark - loginStatusDelegate
- (void)loginWithStatus:(NSInteger)status
{
    NSLog(@"login status %i",status);
}

- (void)loginFinishWithStatus:(NSInteger)status andAgentInfo:(agentInfo *)agent
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)loginFaildWithStatus:(NSInteger)status
{
    NSLog(@"login fail status %i",status);
}

#pragma mark - user define function
- (void)createBarItem
{
    UIBarButtonItem *dismissItem = [[UIBarButtonItem alloc] initWithTitle:@"關閉" style:UIBarButtonItemStylePlain target:self action:@selector(dismissView)];
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObject:dismissItem];
    [dismissItem release];
}

- (void)dismissView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
