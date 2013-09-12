//
//  inputNumberViewController.h
//  MLIproposal
//
//  Created by 張星星 on 12/6/11.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <UIKit/UIKit.h>

#define inputNumberViewSize CGSizeMake(266, 409)
enum
{
    inputNumberTypeInt = 0,
    inputNumberTypeFloat = 1,
};
typedef NSUInteger inputNumberType;
@class inputNumberViewController;
@protocol inputNumberDelegate <NSObject>

- (void)inputNumberView:(inputNumberViewController*)view didFinishEnterNumer:(NSNumber*)number andInputKey:(NSString*)key;
@optional
- (void)inputNumberView:(inputNumberViewController *)view didCancelViewWithInputKey:(NSString*)key;
- (void)inputNumberView:(inputNumberViewController *)view didClearViewWithInputKey:(NSString*)key;

@end

@interface inputNumberViewController : UIViewController
{
    id<inputNumberDelegate> delegate;
    IBOutlet UITextField *inputNumberField;
    IBOutlet UIButton *button0;
    IBOutlet UIButton *button00;
    IBOutlet UIButton *button1;
    IBOutlet UIButton *button2;
    IBOutlet UIButton *button3;
    IBOutlet UIButton *button4;
    IBOutlet UIButton *button5;
    IBOutlet UIButton *button6;
    IBOutlet UIButton *button7;
    IBOutlet UIButton *button8;
    IBOutlet UIButton *button9;
    IBOutlet UIButton *buttonDot;
    IBOutlet UIButton *buttonBack;
    IBOutlet UIButton *buttonConfirm;
    
    NSString *inputKey;
    NSInteger numberType;
    NSMutableString *inputString;
    NSString *unitString;
    NSNumber *maxLimitValue;
    NSNumber *minLimitValue;
    BOOL hasLimit;
}
@property (nonatomic, retain) NSString *inputKey;
@property (assign) id<inputNumberDelegate> delegate;
@property (nonatomic) NSInteger numberType;
@property (nonatomic, retain) NSString *unitString;
@property (nonatomic, retain) NSNumber *maxLimitValue;
@property (nonatomic, retain) NSNumber *minLimitValue;
@property (assign) BOOL hasLimit;

- (IBAction)numberButtonPress:(UIButton*)sender;
- (IBAction)dotButtonPress:(UIButton*)sender;
- (IBAction)backButtonPress:(UIButton*)sender;
- (IBAction)confirmButtonPress:(UIButton*)sender;
- (IBAction)cancelButtonPress:(UIButton*)sender;
- (IBAction)clearButtonPress:(UIButton*)sender;

@end
