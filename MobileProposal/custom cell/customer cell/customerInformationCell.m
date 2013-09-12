//
//  customerInformationCell.m
//  MobileProposal
//
//  Created by 張星星 on 13/1/12.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "customerInformationCell.h"

@implementation customerInformationCell
@synthesize nameLabel, phoneLabel;

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
    [nameLabel release], nameLabel = nil;
    [phoneLabel release], phoneLabel = nil;
    [super dealloc];
}
@end
