//
//  proposalInformationCell.h
//  MobileProposal
//
//  Created by 張星星 on 13/1/12.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface proposalInformationCell : UITableViewCell
{
    UILabel *proposalNameLabel;
    UILabel *proposalDate;
    UILabel *proposalComment;
}
@property (nonatomic, retain) IBOutlet UILabel *proposalNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *proposalDate;
@property (nonatomic, retain) IBOutlet UILabel *proposalComment;

@end
