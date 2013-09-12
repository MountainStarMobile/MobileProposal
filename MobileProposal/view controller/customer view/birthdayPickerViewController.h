//
//  birthdayPickerViewController.h
//  MobileProposal
//
//  Created by sinss on 13/2/19.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol birthdayPickerAction <NSObject>

- (void)didClearBirthdayWithKey:(NSString*)key;
- (void)didSelectBirthday:(NSDate*)aDate andKey:(NSString*)key;

@end

@interface birthdayPickerViewController : UIViewController
{
    id <birthdayPickerAction> delegate;
    IBOutlet UIDatePicker *aDatePicker;
    UIToolbar *aToolbar;
    NSDate *currentDate;
    NSString *key;
}

@property (assign) id <birthdayPickerAction> delegate;
@property (nonatomic, retain) IBOutlet UIToolbar *aToolbar;
@property (nonatomic, retain) NSDate *currentDate;
@property (nonatomic, retain) NSString *key;

- (IBAction)cancelItemPress:(id)sender;
- (IBAction)clearItemPress:(id)sender;
- (IBAction)doneItemPress:(id)sender;

@end
