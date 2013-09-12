//
//  customerInformationCell.h
//  MobileProposal
//
//  Created by 張星星 on 13/1/12.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customerInformationCell : UITableViewCell
{
    UILabel *nameLabel;
    UILabel *phoneLabel;
}
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UILabel *phoneLabel;

@end
