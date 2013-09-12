//
//  inputNumberFieldViewController.m
//  MobileProposal
//
//  Created by 張星星 on 13/1/25.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "inputNumberFieldViewController.h"

@interface inputNumberFieldViewController ()


@end

@implementation inputNumberFieldViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [aTextfield becomeFirstResponder];
    [aTextfield setInputAccessoryView:aToolbar];
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

- (IBAction)didmisView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
    
    }];
}

- (IBAction)doneItemPress:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
