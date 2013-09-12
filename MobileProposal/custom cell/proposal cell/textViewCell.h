//
//  textViewCell.h
//  MobileProposal
//
//  Created by sinss on 13/1/16.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

#define lineMaxWords 21
#define lineHeightUnit 20

@interface textViewCell : UITableViewCell
{
    UITextView *aTextView;
}

@property (nonatomic, retain) IBOutlet UITextView *aTextView;


@end
