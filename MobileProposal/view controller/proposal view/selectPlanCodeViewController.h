//
//  selectPlanCodeViewController.h
//  MobileProposal
//
//  Created by sinss on 13/1/28.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@class planAid, customerInfo;
@protocol selectPlanCodeAction <NSObject>

- (void)didSelectPlanAidRecord:(planAid*)aid;

@end

@interface selectPlanCodeViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
{
    id <selectPlanCodeAction> delegate;
    IBOutlet UITableView *aTableView;
    IBOutlet UISearchBar *searchBar;
    NSString *relation;
    customerInfo *aCustomer;
}

@property (assign) id<selectPlanCodeAction> delegate;
@property (nonatomic, retain) NSString *relation;
@property (nonatomic, retain) customerInfo *aCustomer;



@end
