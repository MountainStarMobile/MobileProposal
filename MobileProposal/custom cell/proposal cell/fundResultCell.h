//
//  fundResultCell.h
//  MobileProposal
//
//  Created by sinss on 13/1/16.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fundResultCell : UITableViewCell
{
    UILabel *fundContentLabel;
    UILabel *fundAmountLabel;
}
@property (nonatomic, retain) IBOutlet UILabel *fundContentLabel;
@property (nonatomic, retain) IBOutlet UILabel *fundAmountLabel;

@end
