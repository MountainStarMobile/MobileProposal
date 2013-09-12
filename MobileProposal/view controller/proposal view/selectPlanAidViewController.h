//
//  selectPlanAidViewController.h
//  MobileProposal
//
//  Created by sinss on 13/1/22.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol selectPlanOrderAction <NSObject>

- (void)didSelectPlanOrderWithPeriod:(NSNumber*)period andPeriodDesc:(NSString*)periodDesc andPlanCodeOrder:(NSNumber*)planCodeOrder andPlanCodeDesc:(NSString*)planCodeDesc andIPlanCode:(NSString*)iPlanCode andSplanCode:(NSString*)sPlanCode andCPlanCode:(NSString*)cPlanCode;

@end

@interface selectPlanAidViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    id <selectPlanOrderAction> delegate;
    IBOutlet UITableView *aTableView;
    NSString *planAbbr;
    NSNumber *periodOrder;
    NSNumber *planCodeOrder;
}

@property (assign) id<selectPlanOrderAction> delegate;
@property (nonatomic, retain) NSString *planAbbr;
@property (nonatomic, retain) NSNumber *periodOrder;
@property (nonatomic, retain) NSNumber *planCodeOrder;

@end
