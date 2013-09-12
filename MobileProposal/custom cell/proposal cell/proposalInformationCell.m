//
//  proposalInformationCell.m
//  MobileProposal
//
//  Created by 張星星 on 13/1/12.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "proposalInformationCell.h"

@implementation proposalInformationCell
@synthesize proposalNameLabel, proposalComment, proposalDate;

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
    [proposalNameLabel release], proposalNameLabel = nil;
    [proposalDate release], proposalDate = nil;
    [proposalComment release], proposalComment = nil;
    [super dealloc];
}
@end
