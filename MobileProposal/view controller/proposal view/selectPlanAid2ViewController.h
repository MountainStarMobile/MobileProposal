//
//  selectPlanAid2ViewController.h
//  MobileProposal
//
//  Created by sinss on 13/1/23.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol selectPlanCodeOrderAction <NSObject>

- (void)didSelectPlanCodeOrder:(NSNumber*)order andOrderDesc:(NSString*)orderDesc;

@end

@interface selectPlanAid2ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    id <selectPlanCodeOrderAction> delegate;
    IBOutlet UITableView *aTableView;
    NSString *planAbbr;
    NSNumber *periodOrder;
    NSNumber *planCodeOrder;
}

@property (assign) id <selectPlanCodeOrderAction> delegate;
@property (nonatomic, retain) NSString *planAbbr;
@property (nonatomic, retain) NSNumber *periodOrder;
@property (nonatomic, retain) NSNumber *planCodeOrder;

@end
