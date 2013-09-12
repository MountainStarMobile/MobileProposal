//
//  serviceTelCell.h
//  MobileProposal
//
//  Created by sinss on 13/1/17.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface serviceTelCell : UITableViewCell
{
    UILabel *companyNameLabel;
    UILabel *phoneLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *companyNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *phoneLabel;

@end
