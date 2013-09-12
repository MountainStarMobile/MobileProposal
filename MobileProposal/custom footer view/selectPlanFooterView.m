//
//  selectPlanFooterView.m
//  MobileProposal
//
//  Created by sinss on 13/2/19.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "selectPlanFooterView.h"

@implementation selectPlanFooterView
@synthesize pratButton, messageLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)dealloc
{
    [pratButton release], pratButton = nil;
    [messageLabel release], messageLabel = nil;
    [super dealloc];
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
