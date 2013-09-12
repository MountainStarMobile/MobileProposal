//
//  personalCell.m
//  MobileProposal
//
//  Created by 張星星 on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "personalCell.h"

@implementation personalCell
@synthesize nameLabel, titleLabel, belongLabel;

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
    [nameLabel release], nameLabel = nil;
    [titleLabel release], titleLabel = nil;
    [belongLabel release], belongLabel = nil;
    [super dealloc];
}

@end
