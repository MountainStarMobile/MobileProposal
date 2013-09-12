//
//  customerInformationHeaderView.m
//  MobileProposal
//
//  Created by sinss on 13/1/15.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "customerInformationHeaderView.h"

@implementation customerInformationHeaderView
@synthesize delegate;
@synthesize facebookButton, googlePlusButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)facebookButtonPress:(id)sender
{
    [delegate customerInformationActionDidPressFacebookButton];
}

- (IBAction)googlePlustButtonPress:(id)sender
{
    [delegate customerInformationActionDidPressGooglePlusButton];
}

- (void)dealloc
{
    delegate = nil;
    [facebookButton release], facebookButton = nil;
    [googlePlusButton release], googlePlusButton = nil;
    [super dealloc];
}
@end
