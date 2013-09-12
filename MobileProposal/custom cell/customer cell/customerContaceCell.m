//
//  customerContaceCell.m
//  MobileProposal
//
//  Created by sinss on 13/1/15.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "customerContaceCell.h"

@implementation customerContaceCell
@synthesize dateLabel, contactContentLabel, statusLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
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
    [dateLabel release], dateLabel = nil;
    [contactContentLabel release], contactContentLabel = nil;
    [statusLabel release], statusLabel = nil;
    [super dealloc];
}

@end
