//
//  personalCell.h
//  MobileProposal
//
//  Created by 張星星 on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface personalCell : UITableViewCell
{
    UILabel *nameLabel;
    UILabel *titleLabel;
    UILabel *belongLabel;
}
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *belongLabel;

@end
