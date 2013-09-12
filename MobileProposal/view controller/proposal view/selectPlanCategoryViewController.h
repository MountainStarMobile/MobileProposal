//
//  selectPlanCategoryViewController.h
//  MobileProposal
//
//  Created by 張星星 on 13/2/1.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol selectPlanCategoryAction <NSObject>

- (void)didSelectPlanCategory:(NSInteger)index;

@end

@interface selectPlanCategoryViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>
{
    id <selectPlanCategoryAction> delegate;
    IBOutlet UITableView *aTableView;
    NSInteger rowIndex;
}

@property (assign) NSInteger rowIndex;
@property (assign) id <selectPlanCategoryAction> delegate;

@end
