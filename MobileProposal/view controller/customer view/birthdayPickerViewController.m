//
//  birthdayPickerViewController.m
//  MobileProposal
//
//  Created by sinss on 13/2/19.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "birthdayPickerViewController.h"

@interface birthdayPickerViewController ()

@end

@implementation birthdayPickerViewController
@synthesize currentDate, delegate, aToolbar, key;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    if (currentDate != nil)
        [aDatePicker setDate:currentDate animated:YES];
    [super viewDidAppear:animated];
}

- (void)dealloc
{
    delegate = nil;
    [key release], key = nil;
    [aToolbar release], aToolbar = nil;
    [aDatePicker release], aDatePicker = nil;
    [currentDate release], currentDate = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelItemPress:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clearItemPress:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        [delegate didClearBirthdayWithKey:key];
    }];
}
- (IBAction)doneItemPress:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        [delegate didSelectBirthday:aDatePicker.date andKey:key];
    }];
}

@end
