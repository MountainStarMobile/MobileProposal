//
//  selectPlanAbbrViewController.h
//  MobileProposal
//
//  Created by sinss on 13/1/22.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol selectPlanAbbrAction <NSObject>

- (void)didSelectPlanAbbrWithPlanAbbrCode:(NSString*)planAbbr andPlanAbbrDesc:(NSString*)planAbbrDesc;

@end

@interface selectPlanAbbrViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    id <selectPlanAbbrAction> delegate;
    IBOutlet UITableView *aTableView;
    NSString *relation;
    NSString *planAbbr;
    NSString *planCategory;
    NSString *planType;
    NSString *abbrType;
    NSString *proposalType;
    NSUInteger projectType;
}

@property (assign) id <selectPlanAbbrAction> delegate;
@property (nonatomic, retain) NSString *relation;
@property (nonatomic, retain) NSString *abbrType;
@property (nonatomic, retain) NSString *planCategory;
@property (nonatomic, retain) NSString *planType;
@property (nonatomic, retain) NSString *planAbbr;
@property (nonatomic, retain) NSString *proposalType;
@property (assign)  NSUInteger projectType;

@end
