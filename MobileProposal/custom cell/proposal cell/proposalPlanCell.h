//
//  proposalPlanCell.h
//  MobileProposal
//
//  Created by sinss on 13/1/17.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface proposalPlanCell : UITableViewCell
{
    UILabel *planDescLabel;
    UILabel *detailLabel;
    UILabel *modxPremLabel;
}


@property (nonatomic, retain) IBOutlet UILabel *planDescLabel;
@property (nonatomic, retain) IBOutlet UILabel *detailLabel;
@property (nonatomic, retain) IBOutlet UILabel *modxPremLabel;

@end
