//
//  occuLevelPickerViewController.h
//  MobileProposal
//
//  Created by sinss on 13/2/20.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol selectOccuLevelAction <NSObject>

- (void)didSelectOccuLevel:(NSNumber*)occuLevel andKey:(NSString*)key;

@end

@interface occuLevelPickerViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    id <selectOccuLevelAction> delegate;
    IBOutlet UITableView *aTableView;
    NSNumber *occuLevel;
    NSString *key;
}

@property (assign) id <selectOccuLevelAction> delegate;
@property (nonatomic, retain) NSNumber *occuLevel;
@property (nonatomic, retain) NSString *key;

@end
