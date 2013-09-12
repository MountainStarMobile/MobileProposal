//
//  customerContaceCell.h
//  MobileProposal
//
//  Created by sinss on 13/1/15.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customerContaceCell : UITableViewCell
{
    UILabel *dateLabel;
    UILabel *contactContentLabel;
    UILabel *statusLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain) IBOutlet UILabel *contactContentLabel;
@property (nonatomic, retain) IBOutlet UILabel *statusLabel;

@end
