//
//  selectPlanHeaderView.h
//  MobileProposal
//
//  Created by sinss on 13/1/26.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol selectPlanHeaderAction <NSObject>

- (void)didPressSearchButton;

@end

@interface selectPlanHeaderView : UIView
{
    id <selectPlanHeaderAction> delegate;
    UILabel *titleLabel;
}

@property (assign) id <selectPlanHeaderAction> delegate;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;

- (IBAction)searchButtonPress:(UIButton*)sender;

@end
