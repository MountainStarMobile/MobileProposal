//
//  tempViewController.m
//  MobileProposal
//
//  Created by sinss on 13/2/21.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "tempViewController.h"

@interface tempViewController ()

- (void)createNavigationItem;
- (void)dismissView;

@end

@implementation tempViewController

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
    [self createNavigationItem];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - user define function
- (void)createNavigationItem
{
    UIBarButtonItem *dismissItem = [[UIBarButtonItem alloc] initWithTitle:@"關閉" style:UIBarButtonItemStylePlain target:self action:@selector(dismissView)];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:dismissItem, nil];
    [dismissItem release];
}
- (void)dismissView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
