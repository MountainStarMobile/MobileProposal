//
//  ABCalendarPickerDefaultStyleProvider.h
//  ABCalendarPicker
//
//  Created by Антон Буков on 23.07.12.
//  Copyright (c) 2012 Happy Nation Project. All rights reserved.
//

#import "ABCalendarPicker.h"
#import "ABCalendarPickerStyleProviderProtocol.h"
#import <Foundation/Foundation.h>

@interface ABCalendarPickerDefaultStyleProvider : NSObject<ABCalendarPickerStyleProviderProtocol>

@property (readonly,nonatomic) UIColor * textColor;
@property (readonly,nonatomic) UIColor * textShadowColor;

- (UIControl*)calendarPicker:(ABCalendarPicker*)calendarPicker
            cellViewForTitle:(NSString*)cellTitle
                    andState:(ABCalendarPickerState)state;

- (void)calendarPicker:(ABCalendarPicker*)calendarPicker
 postUpdateForCellView:(UIControl*)control
        onControlState:(UIControlState)controlState
            withEvents:(NSArray*)events
              andState:(ABCalendarPickerState)state;

@property (nonatomic, retain) UIImage * patternImageForGradientBar;

@property (nonatomic, retain) UIImage * normalImage;
@property (nonatomic, retain) UIImage * selectedImage;
@property (nonatomic, retain) UIImage * highlightedImage;
@property (nonatomic, retain) UIImage * selectedHighlightedImage;

@property (nonatomic, retain) UIColor * normalTextColor;
@property (nonatomic, retain) UIColor * disabledTextColor;
@property (nonatomic, retain) UIColor * selectedTextColor;

@property (nonatomic, retain) UIColor * normalTextShadowColor;
@property (nonatomic, retain) UIColor * disabledTextShadowColor;
@property (nonatomic, retain) UIColor * selectedTextShadowColor;

@property (nonatomic) CGSize normalTextShadowPosition;
@property (nonatomic) CGSize disabledTextShadowPosition;
@property (nonatomic) CGSize selectedTextShadowPosition;

@property (nonatomic) NSInteger maxNumberOfDots;

@end
