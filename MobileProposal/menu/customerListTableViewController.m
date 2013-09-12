//
//  customerListTableViewController.m
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "customerListTableViewController.h"
#import "shareFunction.h"
#import "customerManageViewController.h"
#import "customerInformationCell.h"
#import "customerInfo.h"

@interface customerListTableViewController ()

- (void)createFakeData;
- (void)createBarItem;
- (void)addContactItemPress;

@end

@implementation customerListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        [self createFakeData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createBarItem];
    [self fetchSearchResult];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setToolbarHidden:YES animated:YES];
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
    return [fetchCustomerArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *customerInformationCellIdentifier = @"customerInformationCellIdentifier";
    NSUInteger row = [indexPath row];
    customerInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:customerInformationCellIdentifier];
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"customerInformationCell" owner:self options:nil];
        for (id currentObj in topLevelObjects)
        {
            if ([currentObj isKindOfClass:[customerInformationCell class]])
            {
                cell = currentObj;
                break;
            }
        }
        [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
        if (row % 2 == 1)
        {
            UIView *cellView = [[UIView alloc] init];
            [cellView setBackgroundColor:oddCellBackgroundColor];
            [cell setBackgroundView:cellView];
            [cellView release];
        }
    }
    customerInfo *customer = [fetchCustomerArray objectAtIndex:row];
    [cell.nameLabel setText:[NSString stringWithFormat:@"%@(%@)", customer.name, customer.nickName]];
    [cell.phoneLabel setText:[[shareFunction shareFunctionInstance] formatCellPhoneWithCellPhoneNumber:customer.cellPhone]];
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
    NSUInteger row = [indexPath row];
    customerManageViewController *customerManageView = [[customerManageViewController alloc] initWithNibName:@"customerManageViewController" bundle:nil];
    customerInfo *aCustomer = [fetchCustomerArray objectAtIndex:row];
    [customerManageView setACustomer:aCustomer];
    [self.navigationController pushViewController:customerManageView animated:YES];
    [customerManageView release];
}

#pragma mark - UISearchBar delegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [searchKey setString:searchText];
    [self fetchSearchResult];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}


#pragma mark - user define function
- (void)createFakeData
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    customerInfo *customer = [customerInfo new];
    customer.clientID  = [NSString stringWithFormat:@"F00000001"];
    customer.name = [NSString stringWithFormat:@"陳正賢"];
    customer.sex = [NSString stringWithFormat:@"1"];
    customer.birthDate = [NSString stringWithFormat:@"1983/08/17"];
    customer.cellPhone = [NSString stringWithFormat:@"0933042565"];
    customer.nickName = [NSString stringWithFormat:@"陳正賢"];
    customer.education = [NSString stringWithFormat:@"3"];
    customer.tel1 = [NSString stringWithFormat:@"02-26181638"];
    customer.tel2 = [NSString stringWithFormat:@"02-23455511,528"];
    customer.email = [NSString stringWithFormat:@"sinss0000@gmail.com"];
    customer.occuCode = [NSString stringWithFormat:@"01130"];
    customer.facebook = [NSString stringWithFormat:@"https://www.facebook.com/sinss0000"];
    customer.googlePlus = [NSString stringWithFormat:@"https://plus.google.com/u/0/112076371353221753077/posts"];
    [array addObject:customer];
    
    customer = [customerInfo new];
    customer.clientID  = [NSString stringWithFormat:@"F00000002"];
    customer.name = [NSString stringWithFormat:@"陳威有"];
    customer.sex = [NSString stringWithFormat:@"1"];
    customer.birthDate = [NSString stringWithFormat:@"1960/06/20"];
    customer.cellPhone = [NSString stringWithFormat:@"0933042565"];
    customer.nickName = [NSString stringWithFormat:@"陳威有"];
    customer.education = [NSString stringWithFormat:@"4"];
    customer.tel1 = [NSString stringWithFormat:@"02-26181638"];
    customer.tel2 = [NSString stringWithFormat:@"02-23455511,528"];
    customer.email = [NSString stringWithFormat:@"sinss0000@gmail.com"];
    customer.occuCode = [NSString stringWithFormat:@"01130"];
    customer.facebook = [NSString stringWithFormat:@"https://www.facebook.com/sinss0000"];
    customer.googlePlus = [NSString stringWithFormat:@"https://plus.google.com/u/0/112076371353221753077/posts"];
    [array addObject:customer];
    
    customer = [customerInfo new];
    customer.clientID  = [NSString stringWithFormat:@"F00000003"];
    customer.name = [NSString stringWithFormat:@"周杰倫"];
    customer.sex = [NSString stringWithFormat:@"1"];
    customer.birthDate = [NSString stringWithFormat:@"1960/01/01"];
    customer.cellPhone = [NSString stringWithFormat:@"0933042565"];
    customer.nickName = [NSString stringWithFormat:@"周杰倫"];
    customer.education = [NSString stringWithFormat:@"1"];
    customer.tel1 = [NSString stringWithFormat:@"02-26181638"];
    customer.tel2 = [NSString stringWithFormat:@"02-23455511,528"];
    customer.email = [NSString stringWithFormat:@""];
    customer.occuCode = [NSString stringWithFormat:@"01130"];
    customer.facebook = [NSString stringWithFormat:@"https://www.facebook.com/sinss0000"];
    customer.googlePlus = [NSString stringWithFormat:@""];
    [array addObject:customer];
    
    customer = [customerInfo new];
    customer.clientID  = [NSString stringWithFormat:@"F00000004"];
    customer.name = [NSString stringWithFormat:@"蔡依琳"];
    customer.sex = [NSString stringWithFormat:@"2"];
    customer.birthDate = [NSString stringWithFormat:@"1970/01/01"];
    customer.cellPhone = [NSString stringWithFormat:@"0933042565"];
    customer.nickName = [NSString stringWithFormat:@"Jolin"];
    customer.education = [NSString stringWithFormat:@"1"];
    customer.tel1 = [NSString stringWithFormat:@"02-26181638"];
    customer.tel2 = [NSString stringWithFormat:@"02-23455511,528"];
    customer.email = [NSString stringWithFormat:@""];
    customer.occuCode = [NSString stringWithFormat:@"01130"];
    customer.facebook = [NSString stringWithFormat:@"https://www.facebook.com/sinss0000"];
    customer.googlePlus = [NSString stringWithFormat:@"https://plus.google.com/u/0/112076371353221753077/posts"];
    [array addObject:customer];
    
    customer = [customerInfo new];
    customer.clientID  = [NSString stringWithFormat:@"F00000005"];
    customer.name = [NSString stringWithFormat:@"王力宏"];
    customer.sex = [NSString stringWithFormat:@"1"];
    customer.birthDate = [NSString stringWithFormat:@"1960/01/01"];
    customer.cellPhone = [NSString stringWithFormat:@"0933042565"];
    customer.nickName = [NSString stringWithFormat:@"王力宏"];
    customer.education = [NSString stringWithFormat:@"1"];
    customer.tel1 = [NSString stringWithFormat:@"02-26181638"];
    customer.tel2 = [NSString stringWithFormat:@"02-23455511,528"];
    customer.email = [NSString stringWithFormat:@""];
    customer.occuCode = [NSString stringWithFormat:@"01130"];
    customer.facebook = [NSString stringWithFormat:@"https://www.facebook.com/sinss0000"];
    customer.googlePlus = [NSString stringWithFormat:@"https://plus.google.com/u/0/112076371353221753077/posts"];
    [array addObject:customer];

    customer = [customerInfo new];
    customer.clientID  = [NSString stringWithFormat:@"F00000006"];
    customer.name = [NSString stringWithFormat:@"林志伶"];
    customer.sex = [NSString stringWithFormat:@"1"];
    customer.birthDate = [NSString stringWithFormat:@"1960/01/01"];
    customer.cellPhone = [NSString stringWithFormat:@"0933042565"];
    customer.nickName = [NSString stringWithFormat:@"林志伶"];
    customer.education = [NSString stringWithFormat:@"1"];
    customer.tel1 = [NSString stringWithFormat:@"02-26181638"];
    customer.tel2 = [NSString stringWithFormat:@"02-23455511,528"];
    customer.email = [NSString stringWithFormat:@""];
    customer.occuCode = [NSString stringWithFormat:@"01130"];
    customer.facebook = [NSString stringWithFormat:@""];
    customer.googlePlus = [NSString stringWithFormat:@""];
    [array addObject:customer];
    
    customerArray = [[NSArray alloc] initWithArray:array];
}

- (void)createBarItem
{
    UIBarButtonItem *createItem = [[UIBarButtonItem alloc] initWithTitle:@"建立" style:UIBarButtonItemStylePlain target:self action:@selector(addContactItemPress)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObject:createItem];
    [createItem release];
}

- (void)addContactItemPress
{
    customerManageViewController *customerManageView = [[customerManageViewController alloc] initWithNibName:@"customerManageViewController" bundle:nil];
    [self.navigationController pushViewController:customerManageView animated:YES];
    [customerManageView release];

}

- (void)fetchSearchResult
{
    NSString *para = nil;
    if ([searchKey length] == 0)
    {
        para = [NSString stringWithFormat:@"1=1"];
    }
    else
    {
        para = [NSString stringWithFormat:@"name contains '%@' or cellPhone contains '%@' or nickName contains '%@' or tel1 contains '%@' or tel2 contains '%@' or facebook contains '%@' or googlePlus contains '%@' or email contains '%@'", searchKey, searchKey, searchKey, searchKey, searchKey, searchKey, searchKey, searchKey];
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:para];
    NSArray *tmpArray = [customerArray filteredArrayUsingPredicate:predicate];
    fetchCustomerArray = [[NSArray alloc] initWithArray:tmpArray];
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
