//
//  customerRelationCell.m
//  MobileProposal
//
//  Created by sinss on 13/1/15.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "customerRelationCell.h"
#import "customerRelationInfo.h"

#define kSpaceWidth 2
#define kButtonUnit 60

@implementation customerRelationCell
@synthesize delegate, aIndexPath;
@synthesize aScrollView, relationArray;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    delegate = nil;
    [aIndexPath release], aIndexPath = nil;
    [aScrollView release], aScrollView = nil;
    [super dealloc];
}

- (IBAction)relationButtonPress:(UIButton*)sender
{
    [delegate didClickRelationButtonWithCell:aIndexPath andButtonTag:[sender tag]];
}

- (void)createRelationButton
{
    //set scrollView contentSize
    [aScrollView setContentSize:CGSizeMake(5 + kButtonUnit * [relationArray count] + kSpaceWidth * ([relationArray count] - 1), 60)];
    
    //create button
    CGFloat px = 5;
    CGFloat py = 2;
    for (customerRelationInfo *info in relationArray)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(px, py, kButtonUnit, kButtonUnit)];
        [button setTitle:info.relationName forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
        [button setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        [button setShowsTouchWhenHighlighted:YES];
        [aScrollView addSubview:button];
        
        px += kButtonUnit + kSpaceWidth;
    }
}

@end
