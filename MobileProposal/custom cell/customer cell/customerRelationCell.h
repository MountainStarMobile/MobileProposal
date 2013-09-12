//
//  customerRelationCell.h
//  MobileProposal
//
//  Created by sinss on 13/1/15.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@class customerRelationCell;
@protocol customerRelationAction <NSObject>

- (void)didClickRelationButtonWithCell:(NSIndexPath*)indexPath andButtonTag:(NSInteger)tag;

@end

@interface customerRelationCell : UITableViewCell
{
    id <customerRelationAction> delegate;
    NSIndexPath *aIndexPath;
    UIScrollView *aScrollView;
    NSArray *relationArray;
}

@property (assign) id<customerRelationAction> delegate;
@property (nonatomic, retain) NSIndexPath *aIndexPath;
@property (nonatomic, retain) NSArray *relationArray;
@property (nonatomic, retain) IBOutlet UIScrollView *aScrollView;

- (IBAction)relationButtonPress:(UIButton*)sender;

- (void)createRelationButton;

@end
