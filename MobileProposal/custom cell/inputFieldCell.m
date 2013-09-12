//
//  inputFieldCell.m
//  MobileProposal
//
//  Created by sinss on 13/1/25.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "inputFieldCell.h"

@implementation inputFieldCell
@synthesize inputField, titleLabel;

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
    [inputField release], inputField = nil;
    [titleLabel release], titleLabel = nil;
    [super dealloc];
}

@end
