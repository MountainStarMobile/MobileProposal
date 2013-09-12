//
//  basicTableViewController.h
//  MobileProposal
//
//  Created by sinss on 13/1/11.
//  Copyright (c) 2013年 Among. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "loginTableViewController.h"

@interface basicTableViewController : UITableViewController <UISearchBarDelegate>
{
    NSMutableString *searchKey;
}

- (void)fetchSearchResult;

@end
