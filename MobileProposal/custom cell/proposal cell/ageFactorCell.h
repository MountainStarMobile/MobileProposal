//
//  ageFactorCell.h
//  MobileProposal
//
//  Created by sinss on 13/2/19.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ageFactorCell : UITableViewCell
{
    UILabel *ageLabel;
    UILabel *maleLabel;
    UILabel *femaleLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *ageLabel;
@property (nonatomic, retain) IBOutlet UILabel *maleLabel;
@property (nonatomic, retain) IBOutlet UILabel *femaleLabel;

@end
