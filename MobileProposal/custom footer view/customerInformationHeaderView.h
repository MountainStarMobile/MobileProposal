//
//  customerInformationHeaderView.h
//  MobileProposal
//
//  Created by sinss on 13/1/15.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol customerInformationAction <NSObject>

- (void)customerInformationActionDidPressFacebookButton;
- (void)customerInformationActionDidPressGooglePlusButton;

@end

@interface customerInformationHeaderView : UIView
{
    id <customerInformationAction> delegate;
    UIButton *facebookButton;
    UIButton *googlePlusButton;
}

@property (assign) id<customerInformationAction> delegate;
@property (nonatomic, retain) IBOutlet UIButton *facebookButton;
@property (nonatomic, retain) IBOutlet UIButton *googlePlusButton;

- (IBAction)facebookButtonPress:(id)sender;
- (IBAction)googlePlustButtonPress:(id)sender;

@end
