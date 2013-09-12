//
//  selectPlanHeaderView.m
//  MobileProposal
//
//  Created by sinss on 13/1/26.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "selectPlanHeaderView.h"

@implementation selectPlanHeaderView
@synthesize titleLabel, delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
}

- (void)dealloc
{
    delegate = nil;
    [titleLabel release];
    [super dealloc];
}

- (IBAction)searchButtonPress:(UIButton*)sender
{
    [delegate didPressSearchButton];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
