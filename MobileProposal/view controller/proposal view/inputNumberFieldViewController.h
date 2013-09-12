//
//  inputNumberFieldViewController.h
//  MobileProposal
//
//  Created by 張星星 on 13/1/25.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface inputNumberFieldViewController : UIViewController
{
    IBOutlet UIToolbar *aToolbar;
    IBOutlet UITextField *aTextfield;
}

- (IBAction)didmisView:(id)sender;
- (IBAction)doneItemPress:(id)sender;

@end
