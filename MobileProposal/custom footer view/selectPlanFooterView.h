//
//  selectPlanFooterView.h
//  MobileProposal
//
//  Created by sinss on 13/2/19.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface selectPlanFooterView : UIView
{
    UILabel *messageLabel;
    UIButton *pratButton;
}

@property (nonatomic, retain) IBOutlet UIButton *pratButton;
@property (nonatomic, retain) IBOutlet UILabel *messageLabel;

@end
