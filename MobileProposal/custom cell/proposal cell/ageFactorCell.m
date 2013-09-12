//
//  ageFactorCell.m
//  MobileProposal
//
//  Created by sinss on 13/2/19.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "ageFactorCell.h"

@implementation ageFactorCell
@synthesize ageLabel, maleLabel, femaleLabel;

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
    [ageLabel release], ageLabel = nil;
    [maleLabel release], maleLabel = nil;
    [femaleLabel release], femaleLabel = nil;
    [super dealloc];
}
@end
