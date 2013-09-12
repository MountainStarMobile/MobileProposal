//
//  selectPlanTypeViewController.h
//  MobileProposal
//
//  Created by sinss on 13/1/23.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol selectPlanTypeAction <NSObject>

- (void)didSelectPlanType:(NSString*)planType;

@end

@interface selectPlanTypeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    id <selectPlanTypeAction> delegate;
    IBOutlet UITableView *aTableView;
    NSString *planType;
}

@property (assign) id <selectPlanTypeAction> delegate;
@property (nonatomic, retain) NSString *planType;

@end
