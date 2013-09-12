//
//  telephoneViewController.h
//  MobileProposal
//
//  Created by sinss on 13/1/29.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol inputTelephoneAction <NSObject>

- (void)didFinishInputPhoneNumber:(NSString*)phone andSection:(NSString*)section andExtend:(NSString*)extend andKey:(NSString*)key;

@end

@interface telephoneViewController : UIViewController
{
    id <inputTelephoneAction> delegate;
    IBOutlet UITextField *secField;
    IBOutlet UITextField *phonenumberField;
    IBOutlet UITextField *extentField;
    NSString *key;
    NSString *aSection;
    NSString *aPhone;
    NSString *aExtend;
}

@property (assign) id <inputTelephoneAction> delegate;
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSString *aSection;
@property (nonatomic, retain) NSString *aPhone;
@property (nonatomic, retain) NSString *aExtend;

@end
