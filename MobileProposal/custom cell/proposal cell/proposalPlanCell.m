//
//  proposalPlanCell.m
//  MobileProposal
//
//  Created by sinss on 13/1/17.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "proposalPlanCell.h"

@implementation proposalPlanCell
@synthesize planDescLabel, detailLabel, modxPremLabel;

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
    [planDescLabel release], planDescLabel = nil;
    [detailLabel release], detailLabel = nil;
    [modxPremLabel release], modxPremLabel = nil;
    [super dealloc];
}

@end
