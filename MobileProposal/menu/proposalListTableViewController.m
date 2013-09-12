//
//  proposalListTableViewController.m
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "proposalListTableViewController.h"
#import "switchFunction.h"
#import "proposalManageViewController.h"
#import "proposalInformationCell.h"

#import "saveProposalInfo.h"

@interface proposalListTableViewController ()
{
    NSArray *saveProposalArray;
    NSArray *fetchProposalArray;
}

- (void)createBarItem;
- (void)createProposal:(UIBarButtonItem*)sender;
- (void)createFAkeProposalData;

@end

@implementation proposalListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        [self createFAkeProposalData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createBarItem];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
    return [saveProposalArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *proposalCellIdentifier = @"proposalCellIdentifier";
    NSUInteger row = [indexPath row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:proposalCellIdentifier];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:proposalCellIdentifier] autorelease];
        [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
        [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
        [cell.detailTextLabel setBackgroundColor:[UIColor clearColor]];
        [cell.textLabel setBackgroundColor:[UIColor clearColor]];
        if (row % 2 == 1)
        {
            UIView *cellView = [[UIView alloc] init];
            [cellView setBackgroundColor:oddCellBackgroundColor];
            [cell setBackgroundView:cellView];
            [cellView release];
        }
    }
    saveProposalInfo *proposal = [saveProposalArray objectAtIndex:row];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@", proposal.fileName]];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"建立日期:%@, 被保險人:%@",
                                   proposal.processDate,
                                   proposal.i1Relation
                                   ]];
    
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
    proposalManageViewController *proposalManageView = [[proposalManageViewController alloc] initWithNibName:@"proposalManageViewController" bundle:nil];
    saveProposalInfo *info = [saveProposalArray objectAtIndex:row];
    [proposalManageView setAProposal:info];
    [self.navigationController pushViewController:proposalManageView animated:YES];
    
    [proposalManageView release];
}

#pragma mark - UISearchBar delegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
}

#pragma mark - user define function
- (void)createBarItem
{
    UIBarButtonItem *createItem = [[UIBarButtonItem alloc] initWithTitle:@"建立" style:UIBarButtonItemStylePlain target:self action:@selector(createProposal:)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:createItem, nil];
    [createItem release];
}

- (void)createProposal:(UIBarButtonItem*)sender
{
    proposalManageViewController *proposalManageView = [[proposalManageViewController alloc] initWithNibName:@"proposalManageViewController" bundle:nil];
    [self.navigationController pushViewController:proposalManageView animated:YES];
    
    [proposalManageView release];
}

- (void)createFAkeProposalData
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
    saveProposalInfo *proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"好康健終身醫療保險組合"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-11"];
    proposal.modx = [NSString stringWithFormat:@"6"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    proposal.i1Relation = [NSString stringWithFormat:@"陳正賢"];
    [array addObject:proposal];
    
    proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"珍愛久久商品組合"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-10"];
    proposal.modx = [NSString stringWithFormat:@"3"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    proposal.i1Relation = [NSString stringWithFormat:@"蔡依林"];
    [array addObject:proposal];
    
    proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"投資型保險組合"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-09"];
    proposal.modx = [NSString stringWithFormat:@"1"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    proposal.i1Relation = [NSString stringWithFormat:@"陳威有"];
    [array addObject:proposal];
    
    proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"一本萬利外幣險"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-08"];
    proposal.modx = [NSString stringWithFormat:@"1"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    proposal.i1Relation = [NSString stringWithFormat:@"周杰倫"];
    [array addObject:proposal];
    
    proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"養老險組合"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-07"];
    proposal.modx = [NSString stringWithFormat:@"6"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    proposal.i1Relation = [NSString stringWithFormat:@"林志伶"];
    [array addObject:proposal];
    
    proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"意外險組合"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-06"];
    proposal.modx = [NSString stringWithFormat:@"12"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    proposal.i1Relation = [NSString stringWithFormat:@"王雪紅"];
    [array addObject:proposal];
    
    proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"防癌醫療商品組合"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-05"];
    proposal.modx = [NSString stringWithFormat:@"12"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    proposal.i1Relation = [NSString stringWithFormat:@"李大仁"];
    [array addObject:proposal];
    
    proposal = [saveProposalInfo new];
    proposal.fileName = [NSString stringWithFormat:@"實支實付醫療險組合"];
    proposal.processDate = [NSString stringWithFormat:@"102-01-04"];
    proposal.modx = [NSString stringWithFormat:@"3"];
    proposal.agentCode = [NSString stringWithFormat:@"F125650600"];
    proposal.i1Relation = [NSString stringWithFormat:@"陳又青"];
    [array addObject:proposal];
    
    saveProposalArray = [[NSArray alloc] initWithArray:array];
}

@end
