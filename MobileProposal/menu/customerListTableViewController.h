//
//  customerListTableViewController.h
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import "basicTableViewController.h"

@interface customerListTableViewController : basicTableViewController <UISearchBarDelegate>
{
    NSArray *customerArray;
    NSArray *fetchCustomerArray;
}

@end
