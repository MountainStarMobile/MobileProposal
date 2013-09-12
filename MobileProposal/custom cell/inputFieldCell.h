//
//  inputFieldCell.h
//  MobileProposal
//
//  Created by sinss on 13/1/25.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface inputFieldCell : UITableViewCell
{
    UILabel *titleLabel;
    UITextField *inputField;
}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UITextField *inputField;

@end
