//
//  inputNumberViewController.m
//  MLIproposal
//
//  Created by 張星星 on 12/6/11.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import "inputNumberViewController.h"
#import "MathFunction.h"
#import "infoPanel.h"

@interface inputNumberViewController ()

@end

@implementation inputNumberViewController
@synthesize delegate, numberType;
@synthesize inputKey, unitString;
@synthesize hasLimit, maxLimitValue, minLimitValue;

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
    inputString = [[NSMutableString alloc] initWithCapacity:0];
    if (unitString == nil)
    {
        unitString = [[NSString alloc] initWithFormat:@""];
    }
    [inputNumberField setPlaceholder:[NSString stringWithFormat:@"請輸入數字(單位：%@)", unitString]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setContentSizeForViewInPopover:inputNumberViewSize];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
    delegate = nil;
    [inputString release], inputString = nil;
    [unitString release], unitString = nil;
    [inputKey release], inputKey = nil;
    [button00 release], button00 = nil;
    [button0 release], button0 = nil;
    [button1 release], button1 = nil;
    [button2 release], button2 = nil;
    [button3 release], button3 = nil;
    [button4 release], button4 = nil;
    [button5 release], button5 = nil;
    [button6 release], button6 = nil;
    [button7 release], button7 = nil;
    [button8 release], button8 = nil;
    [button9 release], button9 = nil;
    [buttonDot release], buttonDot = nil;
    [buttonBack release], buttonBack = nil;
    [buttonConfirm release], buttonConfirm = nil;
    [maxLimitValue release], maxLimitValue = nil;
    [minLimitValue release], minLimitValue = nil;
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)numberButtonPress:(UIButton*)sender
{
    NSInteger tag = [sender tag];
    NSString *tmp = [NSString stringWithFormat:@"%@%i",inputString, tag];
    if (tag == 11)
    {
        tmp = [NSString stringWithFormat:@"%@%@",inputString, @"00"];
    }
    if (numberType == inputNumberTypeInt)
    {
        if ([[MathFunction mathFunctionInstance] isPureInt:tmp])
        {
            if (tag == 11)
            {
                [inputString appendFormat:@"00"];
            }
            else
            {
                [inputString appendFormat:@"%i",tag];
            }
        }
    }
    else if (numberType == inputNumberTypeFloat)
    {
        if ([[MathFunction mathFunctionInstance] isPureFloat:tmp])
        {       
            [inputString appendFormat:@"%i",tag];
        }
    }
    if (![inputString isEqualToString:@""])
    {
        [inputNumberField setText:[NSString stringWithFormat:@"%@%@",inputString, unitString]];        
    }
    else 
    {
        [inputNumberField setText:@""];
    }
}
- (IBAction)dotButtonPress:(UIButton*)sender
{
    NSString *tmp = [NSString stringWithFormat:@"%@%@",inputString, @"."];
    if (numberType == inputNumberTypeInt)
    {
        if ([[MathFunction mathFunctionInstance] isPureInt:tmp])
        {
            [inputString appendFormat:@"."];
        }
    }
    else if (numberType == inputNumberTypeFloat)
    {
        if ([[MathFunction mathFunctionInstance] isPureFloat:tmp])
        {       
            [inputString appendFormat:@"."];
        }
    }
    if (![inputString isEqualToString:@""])
    {
        [inputNumberField setText:[NSString stringWithFormat:@"%@%@",inputString, unitString]];        
    }
    else 
    {
        [inputNumberField setText:@""];
    }
}
- (IBAction)backButtonPress:(UIButton*)sender
{
    if ([inputString length] == 0)
        return;
    NSRange range = NSMakeRange([inputString length] - 1, 1);
    [inputString deleteCharactersInRange:range];
    if (![inputString isEqualToString:@""])
    {
        [inputNumberField setText:[NSString stringWithFormat:@"%@%@",inputString, unitString]];        
    }
    else 
    {
        [inputNumberField setText:@""];
    }
}
- (IBAction)confirmButtonPress:(UIButton*)sender
{
    double inputNumber = [inputString doubleValue];
    if (hasLimit)
    {
        if (inputNumber > [maxLimitValue doubleValue] || inputNumber < [minLimitValue doubleValue])
        {
            NSString *rangeString = nil;
            if ([maxLimitValue integerValue] == NSIntegerMax)
            {
                rangeString = [NSString stringWithFormat:@"%@%@ ~ 不限", minLimitValue, unitString];
            }
            else
            {
                rangeString = [NSString stringWithFormat:@"%@%@ ~ %@%@",
                               [[MathFunction mathFunctionInstance] displayDefaultNumberWithNumber:minLimitValue],
                               unitString,
                               [[MathFunction mathFunctionInstance] displayDefaultNumberWithNumber:maxLimitValue],
                               unitString];
            }
            [infoPanel showPanelInView:self.view type:infoPanelTypeError title:@"" subTitle:rangeString hideAfter:1.5];
            return;
        }
    }
    [self dismissViewControllerAnimated:YES completion:^{
        [delegate inputNumberView:self didFinishEnterNumer:[NSNumber numberWithDouble:[inputString doubleValue]] andInputKey:inputKey];
    }];
}
- (IBAction)cancelButtonPress:(UIButton*)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        //[delegate inputNumberView:self didCancelViewWithInputKey:inputKey];
    }];
    
}

- (IBAction)clearButtonPress:(UIButton*)sender
{
    inputString = [[NSMutableString alloc] initWithCapacity:0];
    [inputNumberField setText:@""];
}

@end
