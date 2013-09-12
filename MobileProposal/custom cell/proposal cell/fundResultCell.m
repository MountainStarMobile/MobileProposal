//
//  fundResultCell.m
//  MobileProposal
//
//  Created by sinss on 13/1/16.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "fundResultCell.h"

@implementation fundResultCell
@synthesize fundContentLabel, fundAmountLabel;

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
    [fundContentLabel release], fundContentLabel = nil;
    [fundAmountLabel release], fundAmountLabel = nil;
    [super dealloc];
}
@end
