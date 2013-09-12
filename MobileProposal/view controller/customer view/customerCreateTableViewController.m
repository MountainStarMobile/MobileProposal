//
//  customerCreateTableViewController.m
//  MobileProposal
//
//  Created by sinss on 13/1/29.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "customerCreateTableViewController.h"
#import "switchFunction.h"
#import "shareFunction.h"
#import "DateFunction.h"
#import "DatabaseAccess.h"
#import "personalCell.h"
#import "inputFieldCell.h"
#import "customerInfo.h"

typedef NS_ENUM(NSUInteger, customerFieldTag) {
    customerFieldTagName,
    customerFieldTagNickName,
    customerFieldTagCellphone,
    customerFieldTagEmail,
    customerFieldTagZip,
    customerFieldTagFee,
};

@interface customerCreateTableViewController ()
{
    UIToolbar *toolbar;
    NSArray *customerFields;
}

@property (nonatomic, retain) UITextField *currentField;
@property (nonatomic, retain) UITextField *nameField;
@property (nonatomic, retain) UITextField *nickNameField;
@property (nonatomic, retain) UITextField *cellphoneField;
@property (nonatomic, retain) UITextField *emailField;
@property (nonatomic, retain) UITextField *zipField;
@property (nonatomic, retain) UITextField *feeField;


- (void)createBarItem;
- (void)doneItemPress;
- (void)createToolBar;

@end

@implementation customerCreateTableViewController
@synthesize delegate, aCustomer;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        if (customerFields == nil)
        {
            customerFields = [[NSArray alloc] initWithObjects:
                              customerNameKey,
                              customerNickNameKey,
                              customerSexKey,
                              customerBirthdayKey,
                              customerCellKey,
                              customerTel1Key,
                              customerTel2Key,
                              customerEmailKey,
                              customerZipKey,
                              customerAddressKey,
                              customerOccuCodeKey,
                              customerOccuLevelKey,
                              customerFeeKey,
                              nil];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createBarItem];
    [self createToolBar];
    if (aCustomer == nil)
    {
        aCustomer = [customerInfo new];
    }
    UIView *emptyView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    [self.tableView setTableFooterView:emptyView];
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
    delegate = nil;
    [toolbar release]; toolbar = nil;
    [aCustomer release], aCustomer = nil;
    [customerFields release], customerFields = nil;
    [_nameField release], _nameField = nil;
    [_nickNameField release], _nickNameField = nil;
    [_emailField release], _emailField = nil;
    [_zipField release], _zipField = nil;
    [_feeField release], _feeField = nil;
    [_cellphoneField release], _cellphoneField = nil;
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
    {
        return 1;
    }
    return [customerFields count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section] == 0)
    {
        return 110;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *customerInforCellIdentifier = @"customerInforCellIdentifier2";
    static NSString *customerTextfieldCellIdentifier = @"customerTextfieldCellIdentifier";
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
        NSString *key = [customerFields objectAtIndex:row];
        if ([key isEqualToString:customerNameKey] || [key isEqualToString:customerNickNameKey]
             || [key isEqualToString:customerCellKey]
             || [key isEqualToString:customerEmailKey] || [key isEqualToString:customerFeeKey]
             || [key isEqualToString:customerZipKey])
        {
            inputFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:customerTextfieldCellIdentifier];
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
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            }
            
            [cell.titleLabel setText:[[switchFunction switchFunctionInstance] GetCustomerFieldNameWithInputKey:key]];
            [cell.inputField setDelegate:self];
            [cell.inputField setTextAlignment:NSTextAlignmentRight];
            [cell.inputField setPlaceholder:[NSString stringWithFormat:@"請輸入"]];
            [cell.inputField setInputAccessoryView:toolbar];
            if ([key isEqualToString:customerNameKey])
            {
                //0
                [self setNameField:cell.inputField];
                [cell.inputField setTag:customerFieldTagName];
                [cell.inputField setText:aCustomer.name];
                [cell.inputField setKeyboardType:UIKeyboardTypeDefault];
            }
            else if ([key isEqualToString:customerNickNameKey])
            {
                //1
                [self setNickNameField:cell.inputField];
                [cell.inputField setTag:customerFieldTagNickName];
                [cell.inputField setText:aCustomer.nickName];
                [cell.inputField setKeyboardType:UIKeyboardTypeDefault];
            }
            else if ([key isEqualToString:customerCellKey])
            {
                [self setCellphoneField:cell.inputField];
                [cell.inputField setTag:customerFieldTagCellphone];
                [cell.inputField setText:aCustomer.cellPhone];
                [cell.inputField setKeyboardType:UIKeyboardTypePhonePad];
            }
            else if ([key isEqualToString:customerEmailKey])
            {
                //2
                [self setEmailField:cell.inputField];
                [cell.inputField setTag:customerFieldTagEmail];
                [cell.inputField setText:aCustomer.email];
                [cell.inputField setKeyboardType:UIKeyboardTypeEmailAddress];
            }
            else if ([key isEqualToString:customerZipKey])
            {
                //3
                [self setZipField:cell.inputField];
                [cell.inputField setTag:customerFieldTagZip];
                [cell.inputField setText:aCustomer.zipCode];
                [cell.inputField setKeyboardType:UIKeyboardTypeNumberPad];
            }
            else if ([key isEqualToString:customerFeeKey])
            {
                //5
                [self setFeeField:cell.inputField];
                [cell.inputField setTag:customerFieldTagFee];
                [cell.inputField setText:[NSString stringWithFormat:@"%i",[aCustomer.ratingRateLf integerValue]]];
                [cell.inputField setKeyboardType:UIKeyboardTypeNumberPad];
            }
            return cell;
        }
        else
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:customerInforCellIdentifier];
            if (cell == nil)
            {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:customerInforCellIdentifier] autorelease];
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
                [cell.textLabel setTextColor:[UIColor darkGrayColor]];
                [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
                [cell.detailTextLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
            }
            
            [cell.textLabel setText:[[switchFunction switchFunctionInstance] GetCustomerFieldNameWithInputKey:key]];
            
            if ([key isEqualToString:customerTel1Key])
            {
                NSString *extend = nil;
                if ([aCustomer.extend1 length] == 0)
                {
                    extend = [NSString stringWithFormat:@""];
                }
                else
                {
                    extend = [NSString stringWithFormat:@"#%@", aCustomer.extend1];
                }
                [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@ - %@ %@", aCustomer.sec1, aCustomer.tel1,extend]];
            }
            else if ([key isEqualToString:customerTel2Key])
            {
                NSString *extend = nil;
                if ([aCustomer.extend1 length] == 0)
                {
                    extend = [NSString stringWithFormat:@""];
                }
                else
                {
                    extend = [NSString stringWithFormat:@"#%@",aCustomer.extend1];
                }
                [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@ - %@ %@", aCustomer.sec2, aCustomer.tel2, extend]];
            }
            else if ([key isEqualToString:customerSexKey])
            {
                [cell.detailTextLabel setText:[[switchFunction switchFunctionInstance] GetSexDesc:aCustomer.sex]];
            }
            else if ([key isEqualToString:customerBirthdayKey])
            {
                if ([aCustomer.birthDate length] == 0)
                    [cell.detailTextLabel setText:@"請選擇"];
                else
                    [cell.detailTextLabel setText:aCustomer.birthDate];
            }
            else if ([key isEqualToString:customerAddressKey])
            {
                [cell.detailTextLabel setText:aCustomer.address];
            }
            else if ([key isEqualToString:customerOccuCodeKey])
            {
                [cell.detailTextLabel setText:aCustomer.occuCode];
            }
            else if ([key isEqualToString:customerOccuLevelKey])
            {
                [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@",aCustomer.occuLevel]];
            }
            return cell;
        }
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
    NSUInteger row = [indexPath row];
    NSString *key = [customerFields objectAtIndex:row];
    if ([key isEqualToString:customerTel1Key])
    {
        telephoneViewController *telephoneView = [[telephoneViewController alloc] initWithNibName:@"telephoneViewController" bundle:nil];
        [telephoneView setKey:key];
        [telephoneView setASection:aCustomer.sec1];
        [telephoneView setAPhone:aCustomer.tel1];
        [telephoneView setAExtend:aCustomer.extend1];
        [telephoneView setDelegate:self];
        [telephoneView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
        [self presentViewController:telephoneView animated:YES completion:nil];
    }
    else if ([key isEqualToString:customerTel2Key])
    {
        telephoneViewController *telephoneView = [[telephoneViewController alloc] initWithNibName:@"telephoneViewController" bundle:nil];
        [telephoneView setKey:key];
        [telephoneView setASection:aCustomer.sec2];
        [telephoneView setAPhone:aCustomer.tel2];
        [telephoneView setAExtend:aCustomer.extend2];
        [telephoneView setDelegate:self];
        [telephoneView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
        [self presentViewController:telephoneView animated:YES completion:nil];
    }
    else if ([key isEqualToString:customerAddressKey])
    {
        REComposeViewController *composeViewController = [[REComposeViewController alloc] init];
        composeViewController.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
        composeViewController.key = key;
        composeViewController.title = @"輸入地址";
        composeViewController.hasAttachment = YES;
        composeViewController.attachmentImage = [UIImage imageNamed:@"icon.png"];
        composeViewController.delegate = self;
        composeViewController.text = aCustomer.address;
        [self presentViewController:composeViewController animated:YES completion:nil];
        [composeViewController release];
    }
    else if ([key isEqualToString:customerBirthdayKey])
    {
        birthdayPickerViewController *birthdayPicker = [[birthdayPickerViewController alloc] initWithNibName:@"birthdayPickerViewController" bundle:nil];
        [birthdayPicker.aToolbar setTintColor:self.navigationController.navigationBar.tintColor];
        [birthdayPicker setCurrentDate:[DateFunction StringToDate:aCustomer.birthDate]];
        [birthdayPicker setDelegate:self];
        [birthdayPicker setModalTransitionStyle:UIModalTransitionStylePartialCurl];
        [self presentViewController:birthdayPicker animated:YES completion:nil];
    }
    else if ([key isEqualToString:customerOccuLevelKey])
    {
        occuLevelPickerViewController *occuPickerView = [[occuLevelPickerViewController alloc] initWithNibName:@"occuLevelPickerViewController" bundle:nil];
        [occuPickerView setDelegate:self];
        [occuPickerView setOccuLevel:aCustomer.occuLevel];
        [occuPickerView setKey:key];
        [occuPickerView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
        [self presentViewController:occuPickerView animated:YES completion:nil];
    }
}

#pragma mark - UITextFieldDelegate
- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    self.currentField = textField;
    UIView *currentView = [(UITableViewCell*)[textField superview] superview];
    NSIndexPath *indexPath = [[self.tableView indexPathsForRowsInRect:currentView.frame] objectAtIndex:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewRowAnimationTop animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    UIView *currentView = [(UITableViewCell*)[textField superview] superview];
    NSArray *arrays = [self.tableView indexPathsForRowsInRect:currentView.frame];
    [self.tableView reloadRowsAtIndexPaths:arrays withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger tag = [textField tag];
    NSString *newString = [textField text];
    newString = [newString stringByReplacingCharactersInRange:range withString:string];
    switch (tag)
    {
        case customerFieldTagName:
            aCustomer.name = newString;
            break;
        case customerFieldTagNickName:
            aCustomer.nickName = newString;
            break;
        case customerFieldTagCellphone:
            aCustomer.cellPhone = newString;
            break;
        case customerFieldTagEmail:
            aCustomer.email = newString;
            break;
        case customerFieldTagZip:
            aCustomer.zipCode = newString;
            break;
        case customerFieldTagFee:
            aCustomer.ratingRateLf = [NSNumber numberWithInteger:[newString integerValue]];
            break;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - REComposeViewControllerDelegate

- (void)composeViewController:(REComposeViewController *)composeViewController didFinishWithResult:(REComposeResult)result andKey:(NSString *)key
{
    if (result == REComposeResultCancelled)
    {
        NSLog(@"Cancelled");
    }
    
    if (result == REComposeResultPosted)
    {
        NSUInteger rowIndex = [customerFields indexOfObject:key];
        if ([key isEqualToString:customerAddressKey])
        {
            aCustomer.address = composeViewController.text;
        }
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:rowIndex inSection:1]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - telephoneAction
- (void)didFinishInputPhoneNumber:(NSString *)phone andSection:(NSString *)section andExtend:(NSString *)extend andKey:(NSString *)key
{
    if ([key isEqualToString:customerTel1Key])
    {
        aCustomer.sec1 = section;
        aCustomer.tel1 = phone;
        aCustomer.extend1 = extend;
    }
    else if ([key isEqualToString:customerTel2Key])
    {
        aCustomer.sec2 = section;
        aCustomer.tel2 = phone;
        aCustomer.extend2 = extend;
    }
    NSUInteger rowIndex = [customerFields indexOfObject:key];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:rowIndex inSection:1]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - selectOccuLevelAction
- (void)didSelectOccuLevel:(NSNumber *)occuLevel andKey:(NSString *)key
{
    aCustomer.occuLevel = occuLevel;
    NSUInteger rowIndex = [customerFields indexOfObject:key];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:rowIndex inSection:1]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - birthdayPickerAction
- (void)didSelectBirthday:(NSDate *)aDate andKey:(NSString *)key
{
    [aCustomer setBirthDate:[DateFunction DateToString:aDate]];
    NSUInteger rowIndex = [customerFields indexOfObject:key];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:rowIndex inSection:1]] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

- (void)didClearBirthdayWithKey:(NSString *)key
{
    [aCustomer setBirthDate:nil];
    NSUInteger rowIndex = [customerFields indexOfObject:key];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:rowIndex inSection:1]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - user define function
- (void)createBarItem
{
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UITableViewStylePlain target:self action:@selector(doneItemPress)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:doneItem, nil];
    [doneItem release];
}

- (void)doneItemPress
{
    [self dismissViewControllerAnimated:YES completion:^{
        [delegate didFinishCustomerModifyWithCustomerInfo:aCustomer];
    }];
}

- (void)createToolBar
{
    toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *nextItem = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStyleDone target:self action:@selector(nextFieldItemPress)];
    UIBarButtonItem *prevItem = [[UIBarButtonItem alloc] initWithTitle:@"prev" style:UIBarButtonItemStyleDone target:self action:@selector(prevFieldItemPress)];
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithTitle:@"done" style:UIBarButtonItemStyleDone target:self action:@selector(closeKeyboard)];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolbar setItems:[NSArray arrayWithObjects:nextItem, prevItem, flexItem, closeItem,nil]];
    
    [nextItem release];
    [prevItem release];
    [closeItem release];
    [flexItem release];
}

- (void)nextFieldItemPress
{
    NSUInteger tag = [self.currentField tag];
    switch (tag)
    {
        case customerFieldTagName:
            [self.nickNameField becomeFirstResponder];
            break;
        case customerFieldTagNickName:
            [self.emailField becomeFirstResponder];
            break;
        case customerFieldTagEmail:
            [self.zipField becomeFirstResponder];
            break;
        case customerFieldTagZip:
            [self.zipField becomeFirstResponder];
            break;
        case customerFieldTagFee:
            [self.nameField becomeFirstResponder];
            break;
    }
}

- (void)prevFieldItemPress
{
    NSUInteger tag = [self.currentField tag];
    switch (tag)
    {
        case customerFieldTagName:
            [self.feeField becomeFirstResponder];
            break;
        case customerFieldTagNickName:
            [self.nameField becomeFirstResponder];
            break;
        case customerFieldTagEmail:
            [self.nickNameField becomeFirstResponder];
            break;
        case customerFieldTagZip:
            [self.emailField becomeFirstResponder];
            break;
        case customerFieldTagFee:
            [self.zipField becomeFirstResponder];
            break;
    }
}

- (void)closeKeyboard
{
    [self.currentField resignFirstResponder];
}


@end
