//
//  scheduleViewController.m
//  MobileProposal
//
//  Created by sinss on 13/2/26.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "scheduleViewController.h"
#import "ABCalendarPicker.h"
#import "DatabaseAccess.h"
#import "DateFunction.h"

@interface scheduleViewController ()
< UITableViewDataSource, UITableViewDelegate,
ABCalendarPickerDelegateProtocol, ABCalendarPickerDataSourceProtocol>
{
    NSArray *scheduleArray;
    NSMutableArray *fetchScheduleArray;
}

@property (nonatomic, retain) IBOutlet UITableView *aTableView;
@property (nonatomic ,retain) IBOutlet ABCalendarPicker *calendarPicker;
@property (nonatomic, retain) UIImageView *calendarShadow;
@property (nonatomic, retain) NSDate *currentDate;

- (void)createBarItem;
- (void)addScheduleItemPress:(UIBarButtonItem*)sender;

- (NSArray*)fetchScheduleArrayWithDate:(NSDate*)date;

@end

@implementation scheduleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        if (scheduleArray == nil)
        {
            scheduleArray = [[NSArray alloc] initWithArray:[[DatabaseAccess databaseAccessInstance] getSaveSchedule]];
        }
        if (fetchScheduleArray == nil)
        {
            fetchScheduleArray = [[NSMutableArray alloc] initWithCapacity:0];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createBarItem];
    [self.aTableView setDelegate:self];
    [self.aTableView setDataSource:self];
    self.calendarPicker.delegate = self;
    self.calendarPicker.dataSource = self;
    [self.calendarPicker setDate:[NSDate date] andState:ABCalendarPickerStateWeekdays animated:YES];
    [self.view addSubview:self.calendarShadow];
    [self calendarPicker:self.calendarPicker animateNewHeight:self.calendarPicker.bounds.size.height];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [_aTableView release], _aTableView = nil;
    [_calendarPicker release], _calendarPicker = nil;
    [_calendarShadow release], _calendarShadow = nil;
    [_currentDate release], _currentDate = nil;
    [scheduleArray release], scheduleArray = nil;
    [fetchScheduleArray release], fetchScheduleArray = nil;
    [super dealloc];
}

- (UIImageView*)calendarShadow
{
    if (_calendarShadow == nil)
    {
        _calendarShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CalendarShadow"]];
        _calendarShadow.opaque = NO;
    }
    return _calendarShadow;
}

#pragma mark - ABCalendarPickerDelegateProtocol
- (void)calendarPicker:(ABCalendarPicker *)calendarPicker animateNewHeight:(CGFloat)height
{
    self.calendarShadow.frame = CGRectMake(0,CGRectGetMaxY(self.calendarPicker.frame),
                                           self.calendarPicker.frame.size.width,
                                           self.calendarShadow.frame.size.height);
    //自調整大小
    CGRect frame = self.calendarPicker.bounds;
    [self.aTableView setFrame:CGRectMake(0, frame.size.height,
                                         self.view.bounds.size.width,
                                         self.view.bounds.size.height - frame.size.height)];
}
- (void)calendarPicker:(ABCalendarPicker*)calendarPicker
          dateSelected:(NSDate*)date
             withState:(ABCalendarPickerState)state
{
    NSLog(@"date:%@",calendarPicker.selectedDate);
    self.currentDate = date;
    NSArray *tmpArray = [self fetchScheduleArrayWithDate:self.currentDate];
    [fetchScheduleArray removeAllObjects];
    [fetchScheduleArray addObjectsFromArray:tmpArray];
    [self.aTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSArray*)calendarPicker:(ABCalendarPicker*)calendarPicker
             eventsForDate:(NSDate*)date
                   onState:(ABCalendarPickerState)state;
{
    NSArray *tmpArray = [self fetchScheduleArrayWithDate:date];
    return tmpArray;
}

- (NSInteger)calendarPicker:(ABCalendarPicker *)calendarPicker numberOfEventsForDate:(NSDate *)date onState:(ABCalendarPickerState)state
{
    NSArray *tmpArray = [self fetchScheduleArrayWithDate:date];
    return [tmpArray count];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [fetchScheduleArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *scheduleCellIdentfier = @"scheduleCellIdentfier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:scheduleCellIdentfier];
    NSInteger row = [indexPath row];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:scheduleCellIdentfier] autorelease];
    }
    scheduleInfo *info = [fetchScheduleArray objectAtIndex:row];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@",info.status]];
    [cell.detailTextLabel setText:info.conetnt];
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

#pragma mark - user function item

- (void)createBarItem
{
    UIBarButtonItem *addItem = [[[UIBarButtonItem alloc] initWithTitle:@"建立" style:UIBarButtonItemStylePlain target:self action:@selector(addScheduleItemPress:)] autorelease];
    UIBarButtonItem *todayItem = [[[UIBarButtonItem alloc] initWithTitle:@"Today" style:UIBarButtonItemStylePlain target:self action:@selector(todayItemPress:)] autorelease];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:todayItem, addItem, nil];
}

- (void)addScheduleItemPress:(UIBarButtonItem*)sender
{
    
}

- (void)todayItemPress:(UIBarButtonItem*)sender
{
    [self.calendarPicker setDate:[NSDate date] andState:ABCalendarPickerStateWeekdays animated:YES];
}

- (NSArray*)fetchScheduleArrayWithDate:(NSDate*)date
{
    NSString *str = [NSString stringWithFormat:@"processDate='%@'",[DateFunction DateToString:date]];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:str];
    NSArray *tmpArray = [scheduleArray filteredArrayUsingPredicate:predicate];
    return tmpArray;
}
@end
