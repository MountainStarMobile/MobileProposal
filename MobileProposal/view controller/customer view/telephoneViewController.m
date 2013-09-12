//
//  telephoneViewController.m
//  MobileProposal
//
//  Created by sinss on 13/1/29.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "telephoneViewController.h"

@interface telephoneViewController ()

- (void)createToolbarForField;
- (void)doneItemPress;
- (void)dismissView;

@end

@implementation telephoneViewController
@synthesize delegate, key;
@synthesize aSection, aExtend, aPhone;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createToolbarForField];
    [secField becomeFirstResponder];
    [secField setText:aSection];
    [phonenumberField setText:aPhone];
    [extentField setText:aExtend];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    delegate = nil;
    [phonenumberField release], phonenumberField = nil;
    [secField release], secField = nil;
    [extentField release], extentField = nil;
    [key release], key = nil;
    [aSection release], aSection = nil;
    [aExtend release], aExtend = nil;
    [aPhone release], aPhone = nil;
    [super dealloc];
}

- (void)createToolbarForField
{
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithTitle:@"放棄" style:UIBarButtonItemStyleDone target:self action:@selector(dismissView)];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"確定" style:UIBarButtonItemStyleDone target:self action:@selector(doneItemPress)];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [toolbar setItems:[NSArray arrayWithObjects:closeItem, flexItem, doneItem, nil]];
    
    [closeItem release];
    [doneItem release];
    [flexItem release];
    [secField setInputAccessoryView:toolbar];
    [phonenumberField setInputAccessoryView:toolbar];
    [extentField setInputAccessoryView:toolbar];
    [toolbar release];
}

- (void)dismissView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)doneItemPress
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSString *sec = [secField text];
        NSString *phone = [phonenumberField text];
        NSString *extend = [extentField text];
        [delegate didFinishInputPhoneNumber:phone andSection:sec andExtend:extend andKey:key];
    }];
}
@end
